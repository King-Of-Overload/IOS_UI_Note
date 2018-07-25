//
//  ViewController.m
//  LuckyCircle
//
//  Created by Alan Croft on 2018/7/23.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "RotateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer setContents:(__bridge id) [UIImage imageNamed:@"LuckyBackground"].CGImage];
    RotateView *rotateView = [RotateView rotateView];
    [rotateView setCenter:self.view.center];
    [self.view addSubview:rotateView];
    [rotateView startRotate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
