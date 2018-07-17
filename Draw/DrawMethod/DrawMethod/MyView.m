//
//  MyView.m
//  DrawMethod
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (void)drawRect:(CGRect)rect {
//    //方式一：原生C语言 API
//    //获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //绘制，同时添加到上下文中
//    CGContextMoveToPoint(ctx, 50, 50);
//    CGContextAddLineToPoint(ctx, 100, 100);
//    //渲染
//    CGContextStrokePath(ctx);
    
    //方式二：
//    //获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //绘制
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 50, 50);
//    CGPathAddLineToPoint(path, NULL, 100, 100);
//    //将绘制内容添加到上下文
//    CGContextAddPath(ctx, path);
//    //渲染
//    CGContextStrokePath(ctx);
    
    //方式三：OC API
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    UIBezierPath *path = [UIBezierPath new];
//    [path moveToPoint:CGPointMake(50, 50)];
//    [path addLineToPoint:CGPointMake(100, 100)];
//    CGContextAddPath(ctx, path.CGPath);
//    CGContextStrokePath(ctx);
    
    //方式四： C+OC
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 50, 50);
//    CGPathAddLineToPoint(path, NULL, 100, 100);
//    //拼接路径oc
//    UIBezierPath *path1 = [UIBezierPath bezierPathWithCGPath:path];
//    [path1 addLineToPoint:CGPointMake(150, 50)];
//    //添加上下文
//    CGContextAddPath(ctx, path1.CGPath);
//    //渲染
//    CGContextStrokePath(ctx);
    
    //纯 OC实现
    UIBezierPath *path = [UIBezierPath bezierPath];//路径对象
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    //渲染
    [path stroke];
    
}

@end
