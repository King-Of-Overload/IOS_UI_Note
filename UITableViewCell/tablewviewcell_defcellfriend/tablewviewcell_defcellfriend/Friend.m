//
//  Friend.m
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "Friend.h"

@implementation Friend


- (instancetype) initWithDic:(NSDictionary *)dic{
    if(self == [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) friendWithLoc:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
@end
