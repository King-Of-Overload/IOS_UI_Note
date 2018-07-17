//
//  Flag.h
//  KuniFlag
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;


-(instancetype) initWithDict: (NSDictionary *) dict;

+(instancetype) flagWithDict: (NSDictionary *) dict;
@end
