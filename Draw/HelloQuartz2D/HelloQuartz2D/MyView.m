//
//  MyView.m
//  HelloQuartz2D
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //拼接路径 同时把画的路径添加到上下文
    CGContextMoveToPoint(ctx, 50, 50);//起点
    CGContextAddLineToPoint(ctx, 100, 100);//终点
    CGContextAddLineToPoint(ctx, 150, 50);//终点
    //渲染
    CGContextStrokePath(ctx);//渲染路径
}


@end
