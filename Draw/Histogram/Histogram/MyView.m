//
//  MyView.m
//  Histogram
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    NSArray *array = @[@1, @0.5, @0.7, @0.3, @0.1, @0.6];
    for(int i = 0; i < array.count ; i++){
        //计算rect
        CGFloat width = 20;
        CGFloat height = [array[i] floatValue] * rect.size.height;
        CGFloat x = i * 2 * width;
        CGFloat y = rect.size.height - height;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
        [[UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1.0] set];
        [path fill];
    }
   
}


@end
