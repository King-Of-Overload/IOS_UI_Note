//
//  AppModel.h
//  01-应用管理
//
//  Created by Alan Lu on 1/10/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
//提供一个方法出来用来字典转模型
-(instancetype)initWithDict:(NSDictionary *)dict;//instabcetype可以检测真实类型,但instancetype不能做参数

+(instancetype)appModelWithDict:(NSDictionary *)dict;
@end
