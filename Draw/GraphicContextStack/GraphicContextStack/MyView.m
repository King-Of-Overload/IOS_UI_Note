//
//  MyView.m
//  GraphicContextStack
//
//  Created by Salu on 2018/7/17.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //备份
    CGContextSaveGState(ctx);
    CGContextAddArc(ctx, 150, 150, 100, 0, 2 * M_PI, YES);
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 300, 300);
    //设置线宽
    CGContextSetLineWidth(ctx, 10);
    [[UIColor purpleColor] set];
    CGContextStrokePath(ctx);
    //恢复
    CGContextRestoreGState(ctx);
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx, 250, 20);
    CGContextStrokePath(ctx);
}


@end
