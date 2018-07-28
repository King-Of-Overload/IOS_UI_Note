//
//  ViewController.m
//  HelloNSThread
//
//  Created by Alan Croft on 2018/7/25.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //方式一
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo) object:nil];//object为参数
    [thread start];
    //方式二
    [NSThread detachNewThreadSelector:@selector(demo) toTarget:self withObject:nil];
    //方式三
    [self performSelectorInBackground:@selector(demo) withObject:nil];
}

-(void) demo{
    NSLog(@"hello, nsthread \n %@", [NSThread currentThread]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
