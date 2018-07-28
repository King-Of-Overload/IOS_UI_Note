//
//  ViewController.m
//  HelloNSOperation
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
    NSInvocationOperation *invocation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocation) object:nil];
    NSOperationQueue *queue = [NSOperationQueue new];
    [queue addOperation:invocation];
    [invocation start];
    
    //NSBlockOperation
    NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
        //需要执行的代码
        NSLog(@"hello block %@", [NSThread currentThread]);
    }];
    NSOperationQueue *oq = [NSOperationQueue new];
    
    [oq addOperation:blockOp];
    //[blockOp start];
    
    NSOperationQueue *oqSimple = [NSOperationQueue new];
    [oqSimple addOperationWithBlock:^{
        //要执行的逻辑
    }];
    
}

-(void) invocation{
    NSLog(@"hello operation %@",[NSThread currentThread]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
