//
//  ViewController.m
//  AsyncQueue
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
    [self sync];
}

//并行队列的同步,与串行队列同步执行效果一样
- (void) sync{
    dispatch_queue_t queue = dispatch_queue_create("小缘", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"hello %d %@", i, [NSThread currentThread]);
        });
    }
    
}
//并行队列的异步

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
