//
//  ViewController.m
//  02-代码创建按钮
//
//  Created by Alan Lu on 30/9/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//视图加载完毕后调用,由系统自动调用
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"加载完毕");
    //创建一个按钮
    UIButton *head=[UIButton new];
    //设置对应的位置
    head.frame=CGRectMake(100, 100, 120, 120);
    //设置背景图片
    [head setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    [head setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateHighlighted];
    //设置文字
    [head setTitle:@"摸我" forState:UIControlStateNormal];
    [head setTitle:@"别摸我" forState:UIControlStateHighlighted];
    //设置文字颜色
    [head setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [head setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    //监听按钮的点击方法
    [head addTarget:self action:@selector(btn:) forControlEvents: UIControlEventTouchUpInside];
    //添加
    [self.view addSubview:head];
    //添加一个加号按钮
    UIButton *addBtn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:addBtn];
    //监听多个按钮点击
    [addBtn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btn:(UIButton*) btn{
    NSLog(@"一点击");
}

//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return YES;
}


@end
