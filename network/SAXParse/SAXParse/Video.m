//
//  Video.m
//  SAXParse
//
//  Created by Alan Croft on 2018/7/29.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "Video.h"

@implementation Video

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) videoWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end


