//
//  ViewController.m
//  ScrollView_BigImageDisplay
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
    //告诉UIScrollView子view的实际大小
    self.scrollView.contentSize = self.imgView.frame.size;
    //或者：self.scrollView.contentSize = self.imgView.image.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
