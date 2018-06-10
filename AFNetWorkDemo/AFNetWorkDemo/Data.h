//
//  Data.h
//  AFNetWorkDemo
//
//  Created by Alan Lu on 25/10/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataDelegate
-(void)data:(NSMutableArray*) array;//通过代理将得到的JSON数据传递到ViewController
@end

@interface Data : NSObject
@property(nonatomic,weak)id <DataDelegate> delegate;//代理属性
-(void)getData;
@end
