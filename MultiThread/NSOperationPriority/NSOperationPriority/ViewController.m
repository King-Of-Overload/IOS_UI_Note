//
//  ViewController.m
//  NSOperationPriority
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation ViewController
- (NSOperationQueue *) queue{
    if(_queue == nil){
        _queue = [NSOperationQueue new];
    }
    return _queue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op1");
    }];
    //设置优先级最高
    [op1 setQualityOfService:NSQualityOfServiceUserInteractive];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op2");
    }];
    //设置最低优先级
    [op2 setQualityOfService:NSQualityOfServiceBackground];
    [self.queue addOperation:op1];
    [self.queue addOperation:op2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
