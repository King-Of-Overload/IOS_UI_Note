//
//  ViewController.m
//  AppObjectIntroduce
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) loadView{
    NSLog(@"开始加载控制器view");
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor purpleColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//按钮点击事件
- (IBAction)btnClick:(id)sender {
    //UIApplication对象为应用程序对象
    //主要执行应用级别的操作
    //应用程序对象的获取[UIApplication sharedApplication]
    UIApplication *app = [UIApplication sharedApplication];
    //应用图标上的数字，默认情况下为0，不显示，若设置数字则显示
    //获取用户允许
    UIUserNotificationCategory *category = [UIUserNotificationCategory new];
    NSSet *set = [NSSet setWithObject:category];
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:set];
    [app registerUserNotificationSettings:settings];
    [app setApplicationIconBadgeNumber:10];
    //设置联网时网络标识旁边小菊花
    [app setNetworkActivityIndicatorVisible:YES];
    
    
    
}
@end
