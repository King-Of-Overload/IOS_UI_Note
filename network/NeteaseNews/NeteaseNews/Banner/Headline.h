//
//  Headline.h
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Headline : NSObject
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

- (instancetype) initWithDict: (NSDictionary *) dict;

+ (instancetype) headLineWithDict: (NSDictionary *) dict;

//发送异步请求，获取数据，字典转模型
+ (void) headLinesWithSuccess:(void(^)(NSArray *array)) success error: (void(^)(void)) error;
@end
