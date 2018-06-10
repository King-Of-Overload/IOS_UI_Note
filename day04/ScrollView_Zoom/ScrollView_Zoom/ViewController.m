//
//  ViewController.m
//  ScrollView_Zoom
//
//  Created by Taylor on 31/5/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView setDelegate:self];
    //设置scrollview的缩放比例
    self.scrollView.maximumZoomScale = 3.5;//最大放大比例
    self.scrollView.minimumZoomScale = 0.5;//最小缩小比例
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//开始缩放
-(void) scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"开始缩放");
}
//缩放方法
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imgView;
}

//正在缩放
-(void) scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"正在缩放");
}
//缩放结束
-(void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"缩放结束");
}

@end
