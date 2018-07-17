//
//  ViewController.m
//  MyUISlider
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)porgressChanged:(UISlider *)sender {
    self.myView.progressValue = sender.value;
    //[self.myView setNeedsDisplay];
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%", sender.value * 100];
}
@end
