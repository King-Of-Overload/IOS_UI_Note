//
//  LuckyViewController.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "LuckyViewController.h"

@interface LuckyViewController ()

@end

@implementation LuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //帧动画
    [self.imageView setAnimationImages:@[[UIImage imageNamed:@"lucky_entry_light0"],[UIImage imageNamed:@"lucky_entry_light1"]]];
    [self.imageView setAnimationDuration:1];
    
    [self.imageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
