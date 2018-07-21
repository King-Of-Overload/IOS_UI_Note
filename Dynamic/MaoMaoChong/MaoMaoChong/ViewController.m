//
//  ViewController.m
//  MaoMaoChong
//
//  Created by Alan Croft on 2018/7/21.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;

@property (nonatomic, strong) UIAttachmentBehavior *attach;

@property (nonatomic, strong) NSMutableArray *bodies;
@end

@implementation ViewController
-(NSMutableArray *) bodies{
    if(_bodies == nil){
        _bodies = [NSMutableArray array];
    }
    return _bodies;
}
- (UIDynamicAnimator *) animator{
    if(_animator == nil){
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 9; i++) {
        UIView *wormView = [UIView new];
        CGFloat w = 30;
        CGFloat h = 30;
        CGFloat x = i * w;
        CGFloat y = 100;
        [wormView setFrame:CGRectMake(x, y, w, h)];
        [wormView setBackgroundColor:[UIColor orangeColor]];
        //将view切成圆角
        [wormView.layer setMasksToBounds:YES];
        [wormView.layer setCornerRadius:w * 0.5];
        if(i == 8){
            [wormView setFrame:CGRectMake(x, y - h * 0.5, 2 * w, 2 * h)];
            [wormView setBackgroundColor:[UIColor blueColor]];
            [wormView.layer setCornerRadius:w];
            //为蓝色添加拖拽手势
            UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
            [wormView addGestureRecognizer:pan];
        }
        [self.view addSubview:wormView];
        [self.bodies addObject:wormView];
        
    }
    //附着
    for (int i = 0; i < self.view.subviews.count - 1; i++) {
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.view.subviews[i] attachedToItem:self.view.subviews[i+1]];
        [self.animator addBehavior:attachment];
    }
    //添加重力
    UIGravityBehavior *g = [[UIGravityBehavior alloc] initWithItems: self.bodies];
    [_animator addBehavior:g];
    //碰撞
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:_bodies];
    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
    [_animator addBehavior:collision];
}

//拖拽事件
- (void) pan: (UIPanGestureRecognizer *) sender{
    //获取手指的位置
    CGPoint p = [sender locationInView:self.view];
    if(self.attach == nil){
        self.attach = [[UIAttachmentBehavior alloc] initWithItem:sender.view attachedToAnchor:p];
    }
    [self.attach setAnchorPoint:p];//修改手指的位置
    [self.animator addBehavior:self.attach];
    
    //判断是否拖拽结束
    if(sender.state == UIGestureRecognizerStateEnded){
        //移除手指与头的附着行为
        [_animator removeBehavior:self.attach];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
