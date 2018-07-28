//
//  ViewController.m
//  GCDOperation
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //延迟执行
    //参数一： 延迟多长时间
    //参数二： 队列
    //参数三： 任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"task");
    });
    //一次性执行
    //原理：判断token的值，默认为0，执行完成后变为-1，就会不执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"hello %@", [NSThread currentThread]);
    });
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"下载完毕");
    });
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
