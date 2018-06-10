//
//  CarGroup.m
//  tableview_loadPlist
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "CarGroup.h"

@implementation CarGroup

-(instancetype) initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
//        self.title = dict[@"title"];
//        self.desc = dict[@"desc"];
//        self.cars = dict[@"cars"];
        [self setValuesForKeysWithDictionary:dict];//KVC:使用该方法前提是键名与对象名一致
    }
    return self;
}


+(instancetype) groupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
