//
//  ViewController.m
//  LoadMultipleImages
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *photoList;
@end

@implementation ViewController

- (NSMutableArray *) photoList{
    if(_photoList == nil){
        _photoList = [NSMutableArray array];
    }
    return _photoList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //从网络上下载很多张图片
    NSArray *array = @[@"https://img.douyucdn.cn/data/yuba/default/2018/07/08/201807080036306832955862595.1440x0.jpg",@"https://img.douyucdn.cn/data/yuba/default/2018/07/15/20180715164725169646065578.1440x0.jpg",@"https://img.douyucdn.cn/data/yuba/default/2018/05/02/201805020957397442865482141.jpg",@"https://img.douyucdn.cn/data/yuba/default/2018/05/07/201805071122138650971585011.jpg",@"https://img.douyucdn.cn/data/yuba/default/2018/04/21/201804210025592559080057227.jpg"];
    for (int i = 0; i < array.count; i++) {
        [self downloadImage:array[i]];
    }
}

- (void) downloadImage:(NSString *) urlStr{
    //使用并发队列
    dispatch_queue_t queue = dispatch_queue_create("小缘", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_barrier_async(queue, ^{
            [self.photoList addObject:image];
            NSLog(@"保存图片");
        });
        //[self.photoList addObject:image];//此处线程不安全
        NSLog(@"下载完成");
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"图片个数：%zd", self.photoList.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
