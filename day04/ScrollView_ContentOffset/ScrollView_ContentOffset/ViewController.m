//
//  ViewController.m
//  ScrollView_ContentOffset
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
    [self.scrollView setContentSize:self.imgView.image.size];
    
    //隐藏滚动指示器
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    
    //设置UIScrollView内容的内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 50, 30, 5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scroll:(id)sender {
    CGPoint point = self.scrollView.contentOffset;
    point.x += 150;
    point.y += 150;
    //通过block动画实现滚动
//    [UIView animateWithDuration:1.0 animations:^{
//        [self.scrollView setContentOffset:point];
//    }];
    
    //直接使用动画方式设置contentOffset
    [self.scrollView setContentOffset:point animated:YES];
}
@end
