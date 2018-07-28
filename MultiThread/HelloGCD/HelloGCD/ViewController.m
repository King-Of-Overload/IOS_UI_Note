//
//  ViewController.m
//  HelloGCD
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)loadView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.scrollView setBackgroundColor:[UIColor whiteColor]];
    [self setView:self.scrollView];
    self.imageView = [UIImageView new];
    [self.scrollView addSubview:self.imageView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //下载图片，用GCD
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //下载网络图片
        NSURL *url = [NSURL URLWithString:@"https://sta-op.douyucdn.cn/custom-room/ea18dbecdbfffd223d16ab901aeb6f8ae105c4bf.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        //回到主线程修改UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.imageView setImage:img];
            [self.imageView sizeToFit];
            [self.scrollView setContentSize:img.size];
            
        });
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    //创建队列
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    //创建任务
//    dispatch_block_t task = ^{
//        NSLog(@"hello, GCD, %@", [NSThread currentThread]);
//    };
//    //异步执行
//    dispatch_async(queue, task);
//
//    //简化
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"hello, GCD, %@", [NSThread currentThread]);
//    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
