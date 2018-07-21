//
//  ViewController.m
//  SnapBehavior
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
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.view];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //创建甩行为
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.blueView snapToPoint:p];
    [snap setDamping:1];// 0到1，越小幅度越大，类似阻尼  表示晃动幅度
    [self.animator addBehavior:snap];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
