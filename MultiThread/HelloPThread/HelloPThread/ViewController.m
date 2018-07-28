//
//  ViewController.m
//  HelloPThread
//
//  Created by Alan Croft on 2018/7/25.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建线程
    //第一个参数: 线程编号的地址
    //第二个参数: 线程的属性
    //第三个参数: 线程要执行的函数  void * (*) (void *)   ->  void *指向的是任何类型的指针   (*)为地址
    //第四个参数: 要执行的函数的参数
    //函数的返回值为int 0是成功， 非0是失败
    pthread_t pthread;//线程编号
    NSString *name = @"小缘";
    int result = pthread_create(&pthread, NULL, demo, (__bridge void*)name);
    if(result == 0){
        NSLog(@"创建成功");
    }else{
        NSLog(@"失败");
    }
}

void *demo(void *param){
    NSString *name = (__bridge NSString *)param;
    NSLog(@"hello pthread, %@", name);
    return NULL;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
