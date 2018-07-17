//
//  GreenViewController.m
//  HelloNavigationController
//
//  Created by Salu on 2018/7/10.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "GreenViewController.h"
#import "BlueViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"界面加载完成");
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"界面即将显示");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"界面已经显示出来");
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"界面即将消失");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"界面已经消失");
}

-(void)dealloc{
    NSLog(@"dealloc");
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

- (IBAction)go2BlueClick:(id)sender {
    BlueViewController *blueVC = [BlueViewController new];
    [(UINavigationController *)self.parentViewController pushViewController:blueVC animated:YES];
}
@end
