//
//  ViewController.m
//  MaxConcurrent
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
        //设置最大并发数
        [_queue setMaxConcurrentOperationCount:2];
    }
    return _queue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i = 0; i < 10; i++) {
        [self.queue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:2];
            NSLog(@"%d %@", i, [NSThread currentThread]);
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancel:(id)sender {
    [_queue cancelAllOperations];
}

- (IBAction)pause:(id)sender {
    [_queue setSuspended:YES];
}

- (IBAction)resume:(id)sender {
    [_queue setSuspended:NO];
}
@end
