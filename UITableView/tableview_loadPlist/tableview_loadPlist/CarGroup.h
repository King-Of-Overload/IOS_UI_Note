//
//  CarGroup.h
//  tableview_loadPlist
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject

@property(copy ,nonatomic) NSString *title;

@property(copy, nonatomic) NSString *desc;

@property (nonatomic,copy) NSArray *cars;

-(instancetype) initWithDict: (NSDictionary *) dict;//类方法

+(instancetype) groupWithDict:(NSDictionary *) dict;//类直接调动方法
@end
