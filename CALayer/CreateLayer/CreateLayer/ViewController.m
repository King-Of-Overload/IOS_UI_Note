//
//  ViewController.m
//  CreateLayer
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
    //创建
    CALayer *layer = [CALayer new];
    //[layer setBackgroundColor:[UIColor greenColor].CGColor];
    [layer setPosition:CGPointMake(200, 200)];
    [layer setBounds:CGRectMake(0, 0, 100, 100)];
    [layer setContents:(__bridge id)[UIImage imageNamed:@"other"].CGImage];
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self.layer setOpacity:0.0];
    //UITouch *touch = [touches anyObject];
    //CGPoint p = [touch locationInView:self.view];
    //禁用隐式动画(事务)
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    [CATransaction commit];
    //[self.layer setPosition:p];
    
//    //旋转
//    [self.layer setTransform:CATransform3DRotate(self.layer.transform, M_PI_4, 1, 0, 0)];//x轴
    
//    //缩放
//    [self.layer setTransform:CATransform3DScale(self.layer.transform, 0.5, 1, 1)];//x轴
    
//    //平移
//    [self.layer setTransform:CATransform3DTranslate(self.layer.transform, 10, 0, 0)];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
