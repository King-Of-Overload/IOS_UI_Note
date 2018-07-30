//
//  News.h
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *digest;

@property (nonatomic, copy) NSNumber *replyCount;

@property (nonatomic, copy) NSString *imgsrc;

- (instancetype) initWithDict: (NSDictionary *) dict;

+ (instancetype) newsWithDict: (NSDictionary *) dict;

+ (void) newsWithSuccess: (void(^)(NSArray *array))responseSuccess responseError:(void(^)(NSError *error)) responseError;

@end
