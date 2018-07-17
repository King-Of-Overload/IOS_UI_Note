//
//  MyView.m
//  DrawWenZi
//
//  Created by Salu on 2018/7/17.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView



- (void)drawRect:(CGRect)rect {
//    NSString *str = @"幼儿缘";
//    //从某个点绘制
//    //[str drawAtPoint:CGPointZero withAttributes:nil];
//    //绘制到指定的区域
//    [str drawInRect:self.bounds withAttributes:nil];
    
//    UIImage *image = [UIImage imageNamed:@"me"];
//    //[image drawAtPoint:CGPointMake(50, 50)];
//    //[image drawInRect:rect];//拉伸全屏
//    [image drawAsPatternInRect:rect];//平铺
    
    UIImage *image = [UIImage imageNamed:@"timg"];
    //[image drawAtPoint:CGPointZero];
    [image drawAsPatternInRect:rect];
    
}


@end
