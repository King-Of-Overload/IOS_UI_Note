//
//  ViewController.m
//  GroupAnimation
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *blueView = [UIView new];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [blueView setFrame:CGRectMake(100, 100, 20, 20)];
    self.layer = blueView.layer;
    [self.view addSubview:blueView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //组动画
    CAAnimationGroup *group = [CAAnimationGroup new];
    //基本动画，自旋转
    CABasicAnimation *anim = [CABasicAnimation new];
    [anim setKeyPath:@"transform.rotation"];
    [anim setByValue:@(2 * M_PI)];
    //关键帧动画，绕圆转
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation new];
    [keyAnim setKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [keyAnim setPath:path.CGPath];
    [group setDuration:3];
    [group setRepeatCount:INT_MAX];
    [group setAnimations:@[anim, keyAnim]];
    
    [self.layer addAnimation:group forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
