
//
//  MyView.m
//  SimulateImageView
//
//  Created by Salu on 2018/7/17.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"other"];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, 150, 150, 150, 0, 2 * M_PI, YES);
    CGContextClip(ctx);
    [image drawInRect:rect];
}


@end
