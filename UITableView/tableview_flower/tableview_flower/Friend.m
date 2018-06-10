//
//  Friend.m
//  tableview_flower
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "Friend.h"

@implementation Friend

-(instancetype) initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+(instancetype) friendWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
