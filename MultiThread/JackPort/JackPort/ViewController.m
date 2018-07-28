//
//  ViewController.m
//  JackPort
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
    
}

- (IBAction)btnClick:(UIButton *)sender {
    if(self.queue.operationCount == 0){
        [self.queue addOperationWithBlock:^{
            [self random];
        }];
        [_btn setTitle:@"暂停" forState:UIControlStateNormal];
        [self.queue setSuspended:NO];
    }else if (! self.queue.isSuspended){
        //正在执行
        [self.queue setSuspended:YES];
        [self.btn setTitle:@"继续" forState:UIControlStateNormal];
    }
    
    
}

//随机生成3个数字
- (void) random{
    while (!self.queue.isSuspended) {
        [NSThread sleepForTimeInterval:0.05];
        int num1 = arc4random_uniform(10);
        int num2 = arc4random_uniform(10);
        int num3 = arc4random_uniform(10);
        //回到主线程更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.numberOne setText:[NSString stringWithFormat:@"%d", num1]];
            [self.numberTwo setText:[NSString stringWithFormat:@"%d", num2]];
            [self.numberThree setText:[NSString stringWithFormat:@"%d", num3]];
        }];
    }
}
@end
