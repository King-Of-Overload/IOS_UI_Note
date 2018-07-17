//
//  ViewController.m
//  DoubleCircleImg
//
//  Created by Salu on 2018/7/17.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"xiaoyuan"];
    CGFloat margin = 10;
    CGSize ctxSize = CGSizeMake(image.size.width + 2 *margin, image.size.height + 2*margin);
    UIGraphicsBeginImageContextWithOptions(ctxSize, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint arcCenter = CGPointMake(ctxSize.width * 0.5, ctxSize.height * 0.5);
    CGFloat radius = (image.size.width + margin) * 0.5;
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, radius, 0, 2 *M_PI, YES);
    CGContextSetLineWidth(ctx, margin);
    //渲染圆环
    CGContextStrokePath(ctx);
    //画图片
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, image.size.width * 0.5, 0, 2 *M_PI, YES);
    //裁剪
    CGContextClip(ctx);
    [image drawAtPoint:CGPointMake(margin, margin)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
