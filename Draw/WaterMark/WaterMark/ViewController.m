//
//  ViewController.m
//  WaterMark
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
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *image = [UIImage imageNamed:@"pic"];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];
    //添加文字
    NSString *str = @"幼儿缘";
    //文字水印
    [str drawAtPoint:CGPointMake(20, 20) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    UIImage *icon = [UIImage imageNamed:@"icon"];
    [icon drawAtPoint:CGPointMake(image.size.width * 0.7, image.size.height * 0.7)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    UIGraphicsEndImageContext();
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
