//
//  ViewController.m
//  03-按钮的基本使用
//
//  Created by Alan Lu on 30/9/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//放大
-(IBAction)zoomup;
//缩小
-(IBAction)zoomdown;

//移动
-(IBAction)move:(UIButton*)btn;

//头像按钮
@property(nonatomic,weak)IBOutlet UIButton *head;
@end

@implementation ViewController

-(void)zoomup{
    //NSLog(@"zoomup");
    //1、拿到对象的结构体属性frame，赋值给临时变量，
    CGRect tempBounds=self.head.bounds;
    //2、修改临时变量的值
    tempBounds.size.width+=10;
    tempBounds.size.height+=10;
    //用临时变量的值覆盖原来的变量
    self.head.bounds=tempBounds;
    NSLog(@"%@",NSStringFromCGRect(self.head.bounds));
}

-(void)zoomdown{
    //NSLog(@"zoomdown");
    CGRect tempFrame=self.head.frame;
    //2、修改临时变量的值
    tempFrame.size.width-=10;
    tempFrame.size.height-=10;
    //用临时变量的值覆盖原来的变量
    self.head.frame=tempFrame;
    NSLog(@"%@",NSStringFromCGRect(self.head.frame));
}
//当用一个方法监听按钮点击的时候，我们如果传入一个参数，那么会把点击的按钮当成参数传递
-(void)move:(UIButton*)btn{
    //NSLog(@"移动");
    //NSLog(@"%@",btn);
    //开启动画
    [UIView beginAnimations:nil context:nil];
    //设置动画的时间
    [UIView setAnimationDuration:2.0];
    CGFloat margin=150;
    CGRect tempFrame=self.head.frame;
    //临时的值进行变化
    
    switch (btn.tag) {
        case 10:
            tempFrame.origin.y-=margin;
            break;
        case 20:
            tempFrame.origin.y+=margin;
            break;
        case 30:
            tempFrame.origin.x-=margin;
            break;
        case 40:
            tempFrame.origin.x+=margin;
            break;
    }
    self.head.frame=tempFrame;
    [UIView commitAnimations];//提交动画
}


@end
