//
//  ViewController.m
//  BasicAnimation
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
//    //基本动画
//    CABasicAnimation *anim = [CABasicAnimation new];
//    //怎么做动画
//    [anim setKeyPath:@"position.x"];//修改属性
////    [anim setFromValue:@(10)];
////    [anim setToValue:@(300)];
//    [anim setByValue:@(10)];//累加
//    //不希望回到原来的位置
//    [anim setFillMode:kCAFillModeForwards];
//    [anim setRemovedOnCompletion:NO];
//    [self.layer addAnimation:anim forKey:nil];
    
    //关键帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation new];
    [anim setKeyPath:@"position"];
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(150, 100)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 150)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(150, 150)];
    [anim setValues:@[v1, v2, v3, v4]];//关键的点
    //还可以不设置点，设置路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [anim setPath:path.CGPath];
    [anim setDuration:5];//时间
    [anim setRepeatCount:INT_MAX];//重复次数
    [self.layer addAnimation:anim forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
