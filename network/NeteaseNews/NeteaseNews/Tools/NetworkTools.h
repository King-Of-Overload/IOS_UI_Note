//
//  NetworkTools.h
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkTools : AFHTTPSessionManager
+ (instancetype) sharedManager;
@end
