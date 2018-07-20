//
//  ViewController.m
//  TransformAnimation
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger imageName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageName = 0;
}

//轻扫手势执行方法
- (IBAction)imageChange:(UISwipeGestureRecognizer *)sender {
    self.imageName ++;
    if(self.imageName == 5){
        self.imageName = 0;
    }
    [self.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld", self.imageName + 1]]];
    //创建转场动画
    CATransition *anim = [CATransition new];
    [anim setType:@"cube"];
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft){//从右往左
        [anim setSubtype:kCATransitionFromRight];//设置动画方向
    }else if(sender.direction == UISwipeGestureRecognizerDirectionRight){//从左往右
        [anim setSubtype:kCATransitionFromLeft];//设置动画方向
    }
    //添加动画
    [self.imageView.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
