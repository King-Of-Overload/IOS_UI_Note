//
//  AppModel.m
//  01-应用管理
//
//  Created by Alan Lu on 1/10/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        self.icon=dict[@"icon"];
        self.name=dict[@"name"];
    }
    return self;
}

+(instancetype)appModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
