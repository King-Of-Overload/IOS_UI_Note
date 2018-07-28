//
//  Message.h
//  JSON2Model
//
//  Created by Alan Croft on 2018/7/28.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) int messageId;
@end
