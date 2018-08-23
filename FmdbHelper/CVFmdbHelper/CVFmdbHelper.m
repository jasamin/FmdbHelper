//
//  CVFmdbHelper.m
//  FMDBM
//
//  Created by Hanrun on 2018/8/15.
//  Copyright © 2018年 Hanrun. All rights reserved.
//

#import "CVFmdbHelper.h"



@interface CVFmdbHelper ()
{
    
}
@property(copy,nonatomic) NSString *dbPath;
@end


static CVFmdbHelper *dbmodel = nil;

@implementation CVFmdbHelper
#pragma mark - 创建
+ (CVFmdbHelper *)shareDelegate {
    
    @synchronized (self){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dbmodel = [[self alloc]init];
            dbmodel = [[CVFmdbHelper alloc]init];
    
            dbmodel.dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingString:@"/task.db"];
            NSLog(@"%@",dbmodel.dbPath);
            dbmodel.userDefaults = [NSUserDefaults standardUserDefaults];

            [CVFmdbHelper creatDataBase];
        });
    }
    
    return dbmodel;
}



+ (void)creatDataBase {
    
    dbmodel.db = [[FMDatabase alloc]initWithPath:dbmodel.dbPath];
    FMDatabase * db = dbmodel.db;
    [db open];
    [db close];
}

+ (void)cheakDataBaseNil {
    if (!dbmodel.db) {
        [CVFmdbHelper creatDataBase];
    }
}

- (void)createTableWithName:(NSString *)nameStr andVualeNames:(NSArray *)names {
   
    [CVFmdbHelper cheakDataBaseNil];
    if ([[dbmodel.userDefaults valueForKey:nameStr] integerValue] != 1) {
       if (names.count < 1) {
           return;
       }
       [dbmodel.db open];
       
       NSString *updateStr = [NSString stringWithFormat:@"create table %@",nameStr];
       NSString *values = @"(";
       for (NSString *name in names) {
           values = [values stringByAppendingString:[NSString stringWithFormat:@"%@ text,",name]];
       }
       values = [[values substringToIndex:values.length-1] stringByAppendingString:@")"];
       updateStr = [updateStr stringByAppendingString:values];
        BOOL creatDataBase=[dbmodel.db executeUpdate:updateStr];
        if (creatDataBase) {
            NSLog(@"创表成功");
            [dbmodel.userDefaults setObject:@"1" forKey:nameStr];
            [dbmodel.userDefaults synchronize];
        }else {
            NSLog(@"创建表失败");
        }
       [dbmodel.db close];
    }
}


#pragma mark - 增

- (void)addValueIntoTable:(NSString *)tableName vaules:(NSArray *)vaules {
    FMDatabase *db = dbmodel.db;
    if(![db open]){
        return;
    }
    
    NSString *updateStr = [NSString stringWithFormat:@"insert into %@ values(",tableName];
    for (NSInteger i = 0;i<vaules.count;i++) {
        updateStr = [updateStr stringByAppendingString:@"?,"];
    }
    updateStr = [[updateStr substringToIndex:updateStr.length-1] stringByAppendingString:@")"];
    
    BOOL insertTopic = [db executeUpdate:updateStr values:vaules error:nil];
    if (!insertTopic) {
        NSLog(@"添加失败");
    }else {
        NSLog(@"添加成功");
    }
    [db close];
}


#pragma mark - 删
-(BOOL)clearTable:(NSString *)table {
    FMDatabase *database = dbmodel.db;
    if (![database open]) {
        return NO;
    }
    BOOL deletResult=[database executeUpdate:[NSString stringWithFormat:@"delete from %@",table]];
    if (deletResult) {
        NSLog(@"表数据删除成功");
        return YES;
    }
    return NO;
}

- (BOOL)deleteFrom:(NSString *)tablename whereKey:(NSString *)key isEqure:(NSString *)value {
    FMDatabase *database = dbmodel.db;
    if (![database open]) {
        return NO;
    }
    BOOL deletResult=[database executeUpdate:[NSString stringWithFormat:@"delete from %@ where %@ = '%@'",tablename,key,value]];
    if (deletResult) {
        NSLog(@"数据删除成功");
        return YES;
    }
    return NO;
}

#pragma mark - 改
- (BOOL)uppdateDataFromTablename:(NSString *)tableName whereKey:(NSString *)key isEqual:(NSString *)values newValue:(NSString *)newValue result:(succeeded)resultArr {
    NSLog(@"%s", __func__);
    
    [self uppdateDataFromTablename:tableName whereKey:key isEqual:values setKey:key setValue:newValue result:^(BOOL suc) {
        resultArr(suc);
    }];
    
    return NO;
}

- (BOOL)uppdateDataFromTablename:(NSString *)tableName whereKey:(NSString *)key isEqual:(NSString *)values setKey:(NSString *)setKey setValue:(NSString *)setValue result:(succeeded)resultArr {
    NSLog(@"%s", __func__);
    FMDatabase *db = dbmodel.db;
    if ([db open]) {
        NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET %@ = %@ WHERE %@ = %@",tableName,setKey,setValue,key,values];
        BOOL res = [db executeUpdate:sql];
        if (!res) {
            NSLog(@"数据[%@]更新失败 = %@",key,values);
        } else {
            NSLog(@"数据[%@]更新成功 = %@",key,values);
        }
        resultArr(res);
        [db close];
        return res;
    }
    return NO;
}

#pragma mark - 查
- (void)findDataFromDatabase:(NSString *)dbName result:(resultBlock)resultArr  {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",dbName];
    resultArr([self dealResultset:sql]);
}

- (void)findDataFromDatabase:(NSString *)dbName whereKey:(NSString *)key isEqual:(NSString *)values result:(resultBlock)resultArr  {
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@=\'%@\'",dbName,key,values];
    resultArr([self dealResultset:sql]);
}

- (void)findDataFromTable:(NSString *)tableName whereKey:(NSString *)key like:(NSString *)value result:(resultBlock)resultArr  {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ LIKE \'%%%@%%\'",tableName,key,value];
    resultArr([self dealResultset:sql]);
}

- (NSMutableArray *)dealResultset:(NSString *)sqlString {
    FMDatabase *data = dbmodel.db;
    [data open];
    FMResultSet *resultset = [data executeQuery:sqlString];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    while ([resultset next])
    {
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
        int count = [resultset columnCount];
        for (int i=0; i<count; i++) {
            NSString *name = [resultset columnNameForIndex:i];
            NSString *value = [resultset stringForColumnIndex:i];
            [dictionary setValue:value forKey:name];
        }
        NSLog(@"%@",dictionary);
        [arr addObject:dictionary];
    }
    [data close];
    return arr;
}

@end
