//
//  ViewController.m
//  HelloGesture
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UITapGestureRecognizer 敲击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [tap setNumberOfTapsRequired:2];//双击
    [tap setNumberOfTouchesRequired:2];//多指触控
    [self.imageView addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [longPress setMinimumPressDuration:3];//调用间隔设置
    [longPress setAllowableMovement:10.0];//允许移动的像素最大距离(误差范围)，默认为10像素
    [self.imageView addGestureRecognizer:longPress];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipe1 setDirection:UISwipeGestureRecognizerDirectionLeft];//从右往左
    [self.imageView addGestureRecognizer:swipe];
    [self.imageView addGestureRecognizer:swipe1];
    
    //旋转
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [rotate setDelegate:self];
    [self.imageView addGestureRecognizer:rotate];
    
    //捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [pinch setDelegate:self];
    [self.imageView addGestureRecognizer:pinch];
    
    //拖拽
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageView addGestureRecognizer:pan];
}

-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


- (void) pan: (UIPanGestureRecognizer *) sender{
    CGPoint p = [sender translationInView:sender.view];
    [self.imageView setTransform:CGAffineTransformTranslate(self.imageView.transform, p.x, p.y)];
    [sender setTranslation:CGPointZero inView:sender.view];
}

-(void) pinch: (UIPinchGestureRecognizer *) sender{
    [self.imageView setTransform:CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale)];
    [sender setScale:1.0];
}

- (void) rotate:(UIRotationGestureRecognizer *) sender{
    [self.imageView setTransform:CGAffineTransformRotate(self.imageView.transform, sender.rotation)];
    [sender setRotation:0.0];//归零取夹角
}

- (void) swipe: (UISwipeGestureRecognizer *) sender{
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"从右往左");
    }else{
        NSLog(@"从左往右");
    }
}

-(void) longPress: (UILongPressGestureRecognizer *) sender{
    NSLog(@"longPress");
}

- (void) tap:(UITapGestureRecognizer *) sender{
    if(sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"点击");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
