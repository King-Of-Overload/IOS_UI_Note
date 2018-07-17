//
//  ViewController.m
//  PreferenceUse
//
//  Created by Salu on 2018/7/15.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

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


- (IBAction)saveClick:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"幼儿缘" forKey:@"yuan"];
    [ud setBool:YES forKey:@"isOn"];
}

- (IBAction)readClick:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *yuan = [ud objectForKey:@"yuan"];
    NSLog(@"%@", yuan);
}
@end
