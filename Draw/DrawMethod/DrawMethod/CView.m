//
//  CView.m
//  DrawMethod
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "CView.h"

@implementation CView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextMoveToPoint(ctx, 50, 50);
//    CGContextAddLineToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 150, 50);
//    CGContextSetLineWidth(ctx, 10);//设置线宽
//    //连接处的样式
//    CGContextSetLineJoin(ctx, kCGLineJoinRound);
//    //头尾样式
//    CGContextSetLineCap(ctx, kCGLineCapRound);
//
//    CGContextStrokePath(ctx);
    
    //OC方式
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(50, 50)];
//    [path addLineToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(150, 50)];
//    //设置线宽
//    [path setLineWidth:30.0];
//    //设置连接处
//    [path setLineJoinStyle:kCGLineJoinRound];
//    //设置头尾
//    [path setLineCapStyle:kCGLineCapRound];
//    [path stroke];
    
    //渲染方式
    
    //C
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextMoveToPoint(ctx, 150, 50);
    //CGContextMoveToPoint(ctx, 50, 50);
    CGContextClosePath(ctx);//关闭路径
    CGContextStrokePath(ctx);
    
}


@end
