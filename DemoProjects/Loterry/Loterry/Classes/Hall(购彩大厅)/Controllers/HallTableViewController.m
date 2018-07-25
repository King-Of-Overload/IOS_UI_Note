//
//  HallTableViewController.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "HallTableViewController.h"

@interface HallTableViewController ()
@property (nonatomic, weak) UIView *coverView;

@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation HallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"CS50_activity_image"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//设置Image的渲染方式为保持原样
    //创建item
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(activityClick)];
    [self.navigationItem setLeftBarButtonItem:item];
}

- (void) activityClick{
    //弹框，添加遮罩
    UIView *coverView = [[UIView alloc] initWithFrame:kScreenSize];
    [coverView setBackgroundColor:[UIColor blackColor]];
    [coverView setAlpha:0.5];
    [self.tabBarController.view addSubview:coverView];
    self.coverView = coverView;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    [imageView setCenter:self.view.center];
    //打开用户交互
    [imageView setUserInteractionEnabled:YES];
    [self.tabBarController.view addSubview:imageView];
    self.imageView = imageView;
    //关闭按钮
    UIImage *closeImg = [UIImage imageNamed:@"alphaClose"];
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(imageView.bounds.size.width - closeImg.size.width, 0, 0, 0)];
    [closeBtn setBackgroundImage:closeImg forState:UIControlStateNormal];
    [closeBtn sizeToFit];//自动设置为图片宽高
    [imageView addSubview:closeBtn];
    [closeBtn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
}

//关闭按钮
- (void) closeClick{
    //关闭遮罩与对话框
    [UIView animateWithDuration:0.25 animations:^{
        [self.coverView removeFromSuperview];
        [self.imageView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
