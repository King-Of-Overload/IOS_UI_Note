//
//  PieView.m
//  PieChart
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (void)drawRect:(CGRect)rect {
    NSArray *array = @[@0.3, @0.1, @0.2, @0.4];
    CGFloat start = 0;
    CGFloat end = 0;
    for(int i =0 ;i < array.count ; i++){
        end = 2 *M_PI * [array[i] floatValue] + start;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:start endAngle:end clockwise:YES];
        [path addLineToPoint:CGPointMake(150, 150)];
        [[UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1.0] set];
        [path fill];
        start = end;//下一次的起点等于上一次的终点
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //重绘
    [self setNeedsDisplay];
}


@end
