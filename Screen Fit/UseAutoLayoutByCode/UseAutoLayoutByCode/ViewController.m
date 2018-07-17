//
//  ViewController.m
//  UseAutoLayoutByCode
//
//  Created by Salu on 2018/7/1.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建蓝色view
    UIView *blueView = [UIView new];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    //创建红色view
    UIView *redView = [UIView new];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    //禁用autoresizing
    [blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    //创建并添加约束
    //创建蓝色约束
    //蓝色高度约束,设置为50
    //A对象的某属性 等于(relatedBy) B对象的某属性 乘以multiplier 加constant
    NSLayoutConstraint *blueHC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:50];
    //把约束添加到blueview上
    [blueView addConstraint:blueHC];
    //距离左边30 距离上边30 距离右边30
    NSLayoutConstraint *blueLC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:30];
    NSLayoutConstraint *blueTC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:30];
    NSLayoutConstraint *blueRC = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:-30];
    //相对于父控件的约束加到父控件中
    [self.view addConstraint:blueLC];
    [self.view addConstraint:blueTC];
    [self.view addConstraint:blueRC];
    //创建红色约束
    //让红色view的高度等于蓝色view的高度
    NSLayoutConstraint *redHC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
    //让红色view顶部距离蓝色view 30，红色view 与蓝色view右对齐
    NSLayoutConstraint *redTC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:30];
    NSLayoutConstraint *redRC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0];
    //红色view宽度等于蓝色view宽度的0.5倍
    NSLayoutConstraint *redWC = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5f constant:0];
    //兄弟view之间的约束添加到父控件中
    [self.view addConstraint: redHC];
    [self.view addConstraint:redTC];
    [self.view addConstraint:redRC];
    [self.view addConstraint:redWC];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
