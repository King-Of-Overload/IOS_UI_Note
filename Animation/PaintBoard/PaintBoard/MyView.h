//
//  MyView.h
//  PaintBoard
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView

@property(nonatomic ,assign) CGFloat lineWidth;

@property (nonatomic, strong) UIColor *lineColor;

- (void)clear;

- (void)back;

- (void)eraser;
@end
