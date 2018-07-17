//
//  Flag.m
//  KuniFlag
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "Flag.h"

@implementation Flag

-(instancetype) initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)flagWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
