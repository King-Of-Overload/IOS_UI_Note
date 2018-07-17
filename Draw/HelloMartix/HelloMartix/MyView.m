//
//  MyView.m
//  HelloMartix
//
//  Created by Salu on 2018/7/17.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextRotateCTM(ctx, M_PI_4);//旋转45度
//    CGContextScaleCTM(ctx, 0.5, 0.5);//缩放，x轴缩放多少，y缩放多少
    CGContextTranslateCTM(ctx, 150, 150);//平移 (x,y)
    CGContextAddArc(ctx, 150, 150, 100, 0, 2 * M_PI, YES);
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 300, 300);
    //设置线宽
    CGContextSetLineWidth(ctx, 10);
    CGContextStrokePath(ctx);
}


@end
