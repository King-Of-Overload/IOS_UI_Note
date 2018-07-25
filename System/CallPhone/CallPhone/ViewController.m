//
//  ViewController.m
//  CallPhone
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.callClick addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside];
}

-(void) callPhone{
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    [app openURL:url];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
