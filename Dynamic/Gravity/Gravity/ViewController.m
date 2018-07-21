//
//  ViewController.m
//  Gravity
//
//  Created by Alan Croft on 2018/7/21.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIView *blueView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *blueView = [UIView new];
    [blueView setFrame:CGRectMake(100, 100, 100, 100)];
    [blueView setBackgroundColor:[UIColor blueColor]];
    self.blueView = blueView;
    [self.view addSubview:blueView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //根据某一范围，创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //根据某一个动力学元素，创建行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    [gravity setAngle:M_PI];//落下的方向，0为三点钟方向，默认朝下
    [gravity setGravityDirection:CGVectorMake(1, 1)];//向量方向，ios坐标轴y轴向下
    [gravity setMagnitude:10.0];//重力量级
    //把行为添加到动画者当中
    [self.animator addBehavior:gravity];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
