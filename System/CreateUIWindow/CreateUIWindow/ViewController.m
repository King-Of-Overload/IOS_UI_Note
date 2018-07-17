//
//  ViewController.m
//  CreateUIWindow
//
//  Created by Salu on 2018/7/9.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createWindowClick:(id)sender {
    //创建一个绿色的UIWindow
    UIWindow *greenW = [[UIWindow alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    [greenW setBackgroundColor:[UIColor greenColor]];
    [greenW setHidden:NO];
    [self.view addSubview:greenW];
    
    //创建一个按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [greenW addSubview:btn];
}


-(void) addBtnClick{
    NSLog(@"加号按钮被点击");
}
@end
