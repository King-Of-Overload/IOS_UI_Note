//
//  Headline.m
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//
//轮播:http://c.m.163.com/nc/ad/headline/0-4.html

#import "Headline.h"
#import "NetworkTools.h"

@implementation Headline

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
- (void) setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+ (instancetype)headLineWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (void)headLinesWithSuccess:(void (^)(NSArray *))success error:(void (^)(void))error{
    [[NetworkTools sharedManager] GET:@"ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        //字典转模型
        NSString *rootKey = responseObject.keyEnumerator.nextObject;//获取字典的第一个键
        NSArray *array = responseObject[rootKey];
        NSMutableArray *arrayModels = [NSMutableArray arrayWithCapacity:4];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Headline *headLine = [Headline headLineWithDict:obj];
            [arrayModels addObject:headLine];
        }];
        if(success){
            success(arrayModels.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull responseError) {
        //失败
        if(error){
            error();//调用block的error回调
        }
    }];
}
@end
