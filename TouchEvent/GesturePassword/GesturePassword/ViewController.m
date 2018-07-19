//
//  ViewController.m
//  GesturePassword
//
//  Created by Alan Croft on 2018/7/19.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置控制器背景，平铺方式
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]]];
    [self.passwordView setPasswordBlock: ^(NSString * pwd) {
        if([pwd isEqualToString:@"012"]){
            return YES;
        }else{
            return NO;
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
