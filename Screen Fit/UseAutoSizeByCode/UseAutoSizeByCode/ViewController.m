//
//  ViewController.m
//  UseAutoSizeByCode
//
//  Created by Salu on 2018/7/1.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, weak) UIView *blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个蓝色view
    UIView *blueView = [[UIView alloc] init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [blueView setFrame:CGRectMake(0, 0, 200, 200)];
    self.blueView = blueView;
    [self.view addSubview:blueView];
    //创建一个红色view
    UIView *redView = [[UIView alloc] init];
    [redView setBackgroundColor:[UIColor redColor]];
    //将红色view加入到蓝色view当中
    [blueView addSubview:redView];
    CGFloat redW = blueView.frame.size.width;
    CGFloat redH = 50;
    CGFloat redX = 0;
    CGFloat redY = blueView.frame.size.height - redH;
    [redView setFrame:CGRectMake(redX, redY, redW, redH)];
    //距离底部固定，上边可伸缩,再设置宽度随父控件伸缩
    [redView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleWidth];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//每次增加蓝色view的高度与宽度
- (IBAction)btnClick:(id)sender {
    CGRect blueFrame = self.blueView.frame;
    //增加高和宽
    blueFrame.size.width += 20;
    blueFrame.size.height += 20;
    self.blueView.frame = blueFrame;
}
@end
