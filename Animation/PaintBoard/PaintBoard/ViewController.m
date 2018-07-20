//
//  ViewController.m
//  PaintBoard
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myView setLineWidth:self.lineWidthProgress.value];
    [self lineColorChange:self.firstBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)lineWidthChagned:(UISlider *)sender {
    [self.myView setLineWidth:sender.value];
}
- (IBAction)lineColorChange:(UIButton *)sender {
    self.myView.lineColor = sender.backgroundColor;
}
//保存到相册
- (IBAction)save:(UIBarButtonItem *)sender {
    //图片上下文
    UIGraphicsBeginImageContextWithOptions(self.myView.bounds.size, NO, 0);
    //截图
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.myView.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(image, NULL , NULL, NULL);
    UIGraphicsEndImageContext();
}

- (IBAction)clear:(UIBarButtonItem *)sender {
    [self.myView clear];
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [self.myView back];
}

- (IBAction)eraser:(UIBarButtonItem *)sender {
    [self.myView eraser];
}
@end
