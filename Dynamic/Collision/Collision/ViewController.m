//
//  ViewController.m
//  Collision
//
//  Created by Alan Croft on 2018/7/21.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIView *blueView;

@property (nonatomic, weak) UIView *orangeView;
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
    
    UIView *orangeView = [UIView new];
    [orangeView setFrame:CGRectMake(170, [UIScreen mainScreen].bounds.size.height - 150, 50, 50)];
    [orangeView setBackgroundColor:[UIColor orangeColor]];
    self.orangeView = orangeView;
    [self.view addSubview:orangeView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //根据某一个动力学元素，创建行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    //把行为添加到动画者当中
    [self.animator addBehavior:gravity];
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView, self.orangeView]];
    [collision addBoundaryWithIdentifier:@"key" fromPoint:CGPointMake(0, 200) toPoint:CGPointMake(200, 250)];//添加边界
    //UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.orangeView.frame];
    //[collision addBoundaryWithIdentifier:@"key" forPath:path];
    [collision setTranslatesReferenceBoundsIntoBoundary:YES];//将外层变为边界
    [collision setCollisionDelegate:self];
    [collision setAction:^{//碰撞监听，移动时调用
        NSLog(@"%@",NSStringFromCGRect(self.blueView.frame));
        
    }];
    [self.animator addBehavior:collision];
}

//碰撞的代理方法
- (void) collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    NSString *str = (NSString *) identifier;
    if([str isEqualToString:@"key"]){
        [self.blueView setBackgroundColor:[UIColor yellowColor]];
    }else{
        [self.blueView setBackgroundColor:[UIColor purpleColor]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
