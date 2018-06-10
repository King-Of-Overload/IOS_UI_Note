//
//  Question.m
//  caitu
//
//  Created by Alan Lu on 25/10/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        self.icon=dict[@"icon"];
        self.title=dict[@"title"];
        self.answer=dict[@"answer"];
        self.options=dict[@"options"];
    }
    return self;
}

+(instancetype)questionWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
