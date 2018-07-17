//
//  Province.m
//  CityPick
//
//  Created by Salu on 2018/7/7.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "Province.h"

@implementation Province

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+(instancetype)proviceWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
