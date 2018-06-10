//
//  Friend.h
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *dec;

@property(nonatomic,copy) NSString *loc;

@property(nonatomic,copy) NSString *icon;




- (instancetype) initWithDic:(NSDictionary *) dic;


+ (instancetype) friendWithLoc:(NSDictionary *) dic;

@end
