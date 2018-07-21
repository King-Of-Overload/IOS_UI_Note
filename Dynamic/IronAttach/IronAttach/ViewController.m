//
//  ViewController.m
//  IronAttach
//
//  Created by Alan Croft on 2018/7/21.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIView *blueView;

@property (nonatomic ,strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UIAttachmentBehavior *attach;
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
    CGPoint p =[touch locationInView:self.view];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.attach = [[UIAttachmentBehavior alloc] initWithItem:self.blueView attachedToAnchor:p];
    //[self.attach setLength:100];//固定刚性附着之间的杆的长度
    [self.attach setDamping:0.5];
    [self.attach setFrequency:0.5];//取值范围0到1 频率
    //加上重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:_attach];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p =[touch locationInView:self.view];
    [self.attach setDamping:0.5];
    [self.attach setFrequency:0.5];//取值范围0到1 频率
    [self.attach setAnchorPoint:p];//修改连接到的点
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
