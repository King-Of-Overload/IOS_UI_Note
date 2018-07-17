//
//  ViewController.m
//  SaveClipImgToAlbum
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
    UIImage *image = [UIImage imageNamed:@"me"];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, image.size.width * 0.5, image.size.height * 0.5, image.size.width *0.5, 0, 2 * M_PI, YES);
    CGContextClip(ctx);
    //将图片画上去
    [image drawAtPoint:CGPointZero];
    //取出来
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.imageView setImage:newImage];
    
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(done:didFinishSavingWithError:contextInfo:), nil);
}

-(void) done:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"保存成功");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
