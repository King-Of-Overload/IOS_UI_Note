//
//  Teacher.m
//  SaveAndRead
//
//  Created by Salu on 2018/7/15.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

//需要归档哪些属性
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
}

//解档哪些属性
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self == [super init]){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}
@end
