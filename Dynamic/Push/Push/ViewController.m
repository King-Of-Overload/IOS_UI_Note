//
//  ViewController.m
//  Push
//
//  Created by Alan Croft on 2018/7/21.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIView *orangeView;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *orangeView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [orangeView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:orangeView];
    self.orangeView = orangeView;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[_orangeView] mode:UIPushBehaviorModeInstantaneous];//持续的推力
    [push setMagnitude:1];//推力量级
    //[push setAngle:M_PI];//角度方向
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.view];
    //计算偏移量
    CGFloat offsetX = (p.x - self.orangeView.center.x) / 50;
    CGFloat offsetY = (p.y - self.orangeView.center.y) / 50;
    [push setPushDirection:CGVectorMake(offsetX, offsetY)];
    [_animator addBehavior:push];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
