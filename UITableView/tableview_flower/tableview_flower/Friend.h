//
//  Friend.h
//  tableview_flower
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject
@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *dec;

@property(nonatomic,copy) NSString *loc;


-(instancetype) initWithDict:(NSDictionary *) dict;

+(instancetype)friendWithDict:(NSDictionary *) dict;
@end
