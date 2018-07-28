//
//  AppInfo.h
//  TableViewApp
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppInfo : NSObject
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *download;

//缓存图片
@property (nonatomic,strong) UIImage *image;

+(instancetype)appInfoWithDict: (NSDictionary *) dict;

- (instancetype) initWithDict: (NSDictionary *) dict;

+(NSArray *) appInfos;
@end
