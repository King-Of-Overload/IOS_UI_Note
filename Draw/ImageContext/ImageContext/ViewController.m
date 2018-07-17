//
//  ViewController.m
//  ImageContext
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
    //开启一个图片类型的上下文
    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
    CGContextRef ctx = UIGraphicsGetCurrentContext();//上下文
    //设置路径
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextStrokePath(ctx);//渲染
    //通过图片类型的图形上下文获取图片对象
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [self.imageView setImage:image];
    //关闭上下文
    UIGraphicsEndImageContext();
    
    //写入到沙盒
    //将Image转换成nsdata 调用writeToFile
    NSData *data = UIImagePNGRepresentation(image);
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"xx.png"];
    [data writeToFile: filePath atomically:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
