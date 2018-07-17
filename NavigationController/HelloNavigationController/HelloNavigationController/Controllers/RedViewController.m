//
//  RedViewController.m
//  HelloNavigationController
//
//  Created by Salu on 2018/7/10.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "RedViewController.h"
#import "GreenViewController.h"

@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航控制器的导航栏的内容
    //设置标题
    [self.navigationItem setTitle:@"红色控制器"];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    //设置多个按钮
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:nil];
    NSArray *btnArray = @[left, right];
    [self.navigationItem setLeftBarButtonItems:btnArray];
}



-(void) addBtn{
    NSLog(@"点击加号");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////通过storyboard拖线实现跳转就会调用该方法
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSString *text = [self.textField text];
//    //获取目标控制器
//    GreenViewController *greenVC = [segue destinationViewController];
//    //设置标题
//    [greenVC.navigationItem setTitle:text];
//}

//点击绿色按钮将文本框文字传到绿色界面
- (IBAction)goToGreenClick:(id)sender {
    //获取文本框的内容
    NSString *text = [self.textField text];
    GreenViewController *greenVC = [GreenViewController new];
    //将文本框的内容传递给绿色控制器导航栏的title
    [greenVC.navigationItem setTitle:text];
    //获得导航控制器
    [self.navigationController pushViewController:greenVC animated:YES];
}
@end
