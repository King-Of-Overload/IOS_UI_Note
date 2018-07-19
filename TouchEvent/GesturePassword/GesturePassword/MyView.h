//
//  MyView.h
//  GesturePassword
//
//  Created by Alan Croft on 2018/7/19.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView

@property (nonatomic, copy) BOOL (^passwordBlock)(NSString *);


@end
