//
//  NetworkTools.m
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)sharedManager{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setTimeoutIntervalForRequest:15.0];
        instance = [[self alloc] initWithBaseURL:url sessionConfiguration:config];
    });
    return instance;
}
@end
