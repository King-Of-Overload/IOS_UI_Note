//
//  ViewController.m
//  Clock
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer *pointer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建表盘
    CALayer *clock = [CALayer new];
    [clock setBounds:CGRectMake(0, 0, 200, 200)];
    [clock setPosition:CGPointMake(200, 200)];
    [clock setContents:(__bridge id)[UIImage imageNamed:@"clock"].CGImage];
    [clock setCornerRadius:100.0];
    [clock setMasksToBounds:YES];
    
    //创建指针
    CALayer *pointer = [CALayer new];
    [pointer setBounds:CGRectMake(0, 0, 2, 100)];
    [pointer setPosition:clock.position];
    [pointer setBackgroundColor:[UIColor redColor].CGColor];
    [pointer setAnchorPoint:CGPointMake(0.5, 0.8)];//锚点
    [self.view.layer addSublayer:clock];
    [self.view.layer addSublayer:pointer];
    self.pointer = pointer;
    
    //计时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    //将显示链接添加到主循环中
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [self timeChange];
}

- (void)timeChange{
    CGFloat angle = 2 * M_PI / 60;//每秒转的角度
//    //获取当前时间
//    NSDate *date = [NSDate date];
//    //格式化器
//    NSDateFormatter *formatter = [NSDateFormatter new];
//    [formatter setDateFormat:@"ss"];
//    CGFloat time = [[formatter stringFromDate:date] floatValue];
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    CGFloat time = [calendar component:NSCalendarUnitSecond fromDate:date];
    
    angle = time * angle;
    [self.pointer setAffineTransform:CGAffineTransformMakeRotation(angle)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
