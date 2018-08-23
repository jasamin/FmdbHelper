//
//  CVGetIvarModel.m
//  FMDBM
//
//  Created by Hanrun on 2018/8/17.
//  Copyright © 2018年 Hanrun. All rights reserved.
//

#import "CVGetIvarModel.h"
#import <objc/runtime.h>

@implementation CVGetIvarModel
+ (NSArray *)getClassPropertyName:(Class)model {
    //获得model的属性个数
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(model, &count);
    NSMutableArray *names = [[NSMutableArray alloc]init];
    for (int i = 0;i < count;i++) {
        Ivar ivar = ivars[i];
        NSString *name = [[NSString stringWithUTF8String:ivar_getName(ivar)] substringFromIndex:1];
        [names addObject:name];
    }
    free(ivars);
    return names;
}

+ (NSArray *)getPropertyValue:(id)obj names:(NSArray *)nameArr{
    NSMutableArray *valueArr = [[NSMutableArray alloc]init];
    for (int i  = 0; i < nameArr.count ; i++) {
        NSString *str = [NSString stringWithFormat:@"%@",[obj valueForKey:nameArr[i]]];
        [valueArr addObject:str];
    }
    return valueArr;
}
@end
