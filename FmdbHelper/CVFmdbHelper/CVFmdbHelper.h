//
//  CVFmdbHelper.h
//  FMDBM
//
//  Created by Hanrun on 2018/8/15.
//  Copyright © 2018年 Hanrun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "CVGetIvarModel.h"


typedef void(^resultBlock)(NSArray *arr);
typedef void(^succeeded)(BOOL suc);


@interface CVFmdbHelper : NSObject
@property (strong, nonatomic) FMDatabase *db;/**< 数据库*/
@property (strong, nonatomic) NSUserDefaults *userDefaults;
+ (CVFmdbHelper *)shareDelegate;
/**
 在db上创建一个表
 
 @param nameStr 表名称
 @param names 列名数组 按顺序添加列名
 */
- (void)createTableWithName:(NSString *)nameStr andVualeNames:(NSArray *)names;
/**
 向表添加数据
 
 @param tableName 表名称
 @param vaules 按以下方法内添加的列名称，按顺序添加对应的值
 
 @see  createTableWithName: andVualeNames:
 
 */
- (void)addValueIntoTable:(NSString *)tableName vaules:(NSArray *)vaules;

/**
 查找表中的所有数据
 
 @param dbName 表名称
 @param resultArr 返回查找的数据字典数组
 */
- (void)findDataFromDatabase:(NSString *)dbName result:(resultBlock)resultArr;

/**
 查找表中建值对应的数据
 
 @param dbName 表名称
 @param key 键名称
 @param values 值
 @param resultArr 查找到的数据字典数组
 */
- (void)findDataFromDatabase:(NSString *)dbName whereKey:(NSString *)key isEqual:(NSString *)values result:(resultBlock)resultArr;

/**
 查询表中键包含字符的数据

 @param tableName 表名称
 @param key 键名称
 @param value 值
 @param resultArr 查找到的数据字典数组
 */
- (void)findDataFromTable:(NSString *)tableName whereKey:(NSString *)key like:(NSString *)value result:(resultBlock)resultArr;

/**
 更新表中某个键的数据
 
 @param tableName 表名称
 @param key 需要修改的键名称
 @param values 旧值，用于匹配key=values
 @param newValue 新值
 @param resultArr 查找到的数据字典数组
 @return 成功/失败
 */
- (BOOL)uppdateDataFromTablename:(NSString *)tableName whereKey:(NSString *)key isEqual:(NSString *)values newValue:(NSString *)newValue result:(succeeded)resultArr;

/**
 条件修改
 
 @param tableName 表名称
 @param key 当条件查找的key
 @param values 当条件查找的value
 @param setKey 需要设置的另外的key
 @param setValue 设置新值
 @param resultArr 查找到的数据字典数组
 @return 成功/失败
 */
- (BOOL)uppdateDataFromTablename:(NSString *)tableName whereKey:(NSString *)key isEqual:(NSString *)values setKey:(NSString *)setKey setValue:(NSString *)setValue result:(succeeded)resultArr;

/**
 清空表中的数据
 
 @param table 表名称
 @return 成功/失败
 */
- (BOOL)clearTable:(NSString *)table;

/**
 根据单个条件删除表中的数据
 
 @param tablename 表名称
 @param key 条件key
 @param value 条件值
 @return 成功/失败
 */
- (BOOL)deleteFrom:(NSString *)tablename whereKey:(NSString *)key isEqure:(NSString *)value;
@end
