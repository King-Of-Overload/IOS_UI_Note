//
//  Question.h
//  caitu
//
//  Created by Alan Lu on 25/10/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property(nonatomic,copy)NSString *icon;//图片

@property(nonatomic,copy)NSString *title;//描述

@property(nonatomic,copy)NSString *answer;//答案

@property(nonatomic,copy) NSArray *options;//待选项

/**
 *提供方法用来字典转模型
 */

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)questionWithDict:(NSDictionary *)dict;

@end
