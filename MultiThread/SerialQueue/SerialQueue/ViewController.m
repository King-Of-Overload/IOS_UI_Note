//
//  ViewController.m
//  SerialQueue
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
    [self async];
}

//串行队列的同步执行, 不会开启新线程, 顺序执行
- (void) sync{
    dispatch_queue_t queue = dispatch_queue_create("小缘", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"hello %d %@", i, [NSThread currentThread]);
        });
    }
    
}

//串行队列的异步执行, 会开启一个新线程，任务是有序执行
- (void) async{
    dispatch_queue_t queue = dispatch_queue_create("小缘", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"hello %d %@", i, [NSThread currentThread]);
        });
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
