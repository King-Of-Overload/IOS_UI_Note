//
//  MyView.m
//  MyUISlider
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 - M_PI_2 endAngle:2 * M_PI * self.progressValue - M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(150, 150)];
    [[UIColor purpleColor] set];
    [path fill];
}

- (void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
    [self setNeedsDisplay];
}




@end
