//
//  Teacher.h
//  SaveAndRead
//
//  Created by Salu on 2018/7/15.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject <NSCoding>
@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) int age;
@end
