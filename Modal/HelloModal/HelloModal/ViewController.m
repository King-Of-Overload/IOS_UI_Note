//
//  ViewController.m
//  HelloModal
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//触摸屏幕调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //跳转到控制器
    ModalViewController *controller = [ModalViewController new];
    [controller setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];//动画
    [self presentViewController:controller animated:YES completion:^{
        NSLog(@"跳转完成");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
