//
//  ViewController.m
//  ScrollView_Delegate
//
//  Created by Taylor on 31/5/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
/**
 监听scrollview的滚动事件
 添加代理
 控制器实现UIScrollViewDelegate协议
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView setDelegate:self];
    [self.scrollView setContentSize: self.imgView.image.size];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"即将开始滚动");
}

//正在滚动时调用
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"正在拖拽");
    //输出位置
    NSString *pointStr = NSStringFromCGPoint(scrollView.contentOffset);
    NSLog(pointStr);
}


-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"拖拽完毕，不是滚动完毕");
}




@end
