//
//  RectView.m
//  DrawMethod
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "RectView.h"

@implementation RectView


- (void)drawRect:(CGRect)rect {
    //矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
//    [path stroke];
    //圆角矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:10.0];
//    [path stroke];
    //oc 椭圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];
//    [path stroke];
    
    //通过画弧线的方式画圆
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [path stroke];
}


@end
