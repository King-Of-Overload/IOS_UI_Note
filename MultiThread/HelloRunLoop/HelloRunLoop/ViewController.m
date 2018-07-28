//
//  ViewController.m
//  HelloRunLoop
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(demo) userInfo:nil repeats:YES];
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop addTimer:timer forMode:NSRunLoopCommonModes];//加入消息循环
}

- (void) demo{
    NSLog(@"hello");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
