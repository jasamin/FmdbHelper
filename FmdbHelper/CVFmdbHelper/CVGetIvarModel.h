//
//  CVGetIvarModel.h
//  FMDBM
//
//  Created by Hanrun on 2018/8/17.
//  Copyright © 2018年 Hanrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CVGetIvarModel : NSObject
+ (NSArray *)getClassPropertyName:(Class)model;
+ (NSArray *)getPropertyValue:(id)obj names:(NSArray *)nameArr;
@end
