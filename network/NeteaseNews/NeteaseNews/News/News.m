//
//  News.m
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//
//新闻：http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html
#import "News.h"
#import "NetworkTools.h"

@implementation News


- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (instancetype)newsWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (void)newsWithSuccess:(void (^)(NSArray *array))responseSuccess responseError:(void (^)(NSError *error))responseError{
    [[NetworkTools sharedManager] GET:@"article/headline/T1348647853363/0-140.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        //获取第一个键
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *array = responseObject[rootKey];
        NSMutableArray *arrayModels = [NSMutableArray array];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            News *news = [News newsWithDict:obj];
            [arrayModels addObject:news];
        }];
        //调用block
        if(responseSuccess){
            responseSuccess(arrayModels.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
