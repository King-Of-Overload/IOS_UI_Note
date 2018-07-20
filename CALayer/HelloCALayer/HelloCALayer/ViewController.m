//
//  ViewController.m
//  HelloCALayer
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [UIView new];
    [view setFrame:CGRectMake(100, 100, 100, 100)];
    [view setBackgroundColor:[UIColor purpleColor]];
    
    [view.layer setBorderWidth:10.0];//设置边框
    [view.layer setShadowOffset:CGSizeZero];//设置阴影,默认不显示
    [view.layer setShadowColor:[UIColor blueColor].CGColor];//颜色
    [view.layer setShadowRadius:50.0];//半径
    [view.layer setShadowOpacity:1];//设置阴影透明度
    [view.layer setCornerRadius:50.0];//圆角半径
    [view.layer setMasksToBounds:YES];//如果超出layer范围就不显示，类似裁剪
    //[view.layer setBounds:CGRectMake(0, 0, 200, 200)];
    [view.layer setPosition:CGPointMake(self.view.center.x, self.view.center.y)];//设置位置，默认中心参考系
    [view.layer setContents:(__bridge id)[UIImage imageNamed:@"other"].CGImage];
    [self.view addSubview:view];//将C方法转换为OC方法
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
