//
//  ViewController.m
//  ScrollView_himalaya
//
//  Created by Taylor on 31/5/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat maxH = CGRectGetMaxY(self.lastImgView.frame);
    [self.scrollView setContentSize:CGSizeMake(0, maxH)];
    [self.scrollView setContentOffset:CGPointMake(0, -64)];
    [self.scrollView setContentInset:UIEdgeInsetsMake(64, 0, 54, 0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
