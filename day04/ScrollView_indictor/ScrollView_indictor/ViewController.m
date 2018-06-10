//
//  ViewController.m
//  ScrollView_indictor
//
//  Created by Taylor on 31/5/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView setDelegate:self];
    //动态创建image添加到滚动组件中
    CGFloat imgW = 320;
    CGFloat imgH = 130;
    CGFloat imgY = 0;
    for(int i = 0; i < 3; i++){
        UIImageView *imgView = [[UIImageView alloc] init];
        //设置图片
        NSString *imgName = [NSString stringWithFormat:@"img%d", i+1];
        [imgView setImage:[UIImage imageNamed:imgName]];
        //计算x的值
        CGFloat imgX = i * imgW;
        //设置frame
        [imgView setFrame:CGRectMake(imgX, imgY, imgW, imgH)];
        //将image添加到scollview中
        [self.scrollView addSubview:imgView];
    }
    //设置scrollview内容大小
    CGFloat maxW = self.scrollView.frame.size.width * 3;
    [self.scrollView setContentSize:CGSizeMake(maxW, 0)];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    
    //获取分页效果
    [self.scrollView setPagingEnabled:YES];
    
    //设置指示器参数
    [self.pageControl setNumberOfPages:3];
    //设置默认所在页
    [self.pageControl setCurrentPage:0];
    
    //启动定时器的两种方式
    //1、 timerWithXX: 启动还需要每次调用fire方法
    //2 、 scheduledXXX创建立刻启动
    
    //创建计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    //修改timer的优先级与控件一样
    //创建一个消息循环对象
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止计时器
    [_timer invalidate];
    _timer = nil;
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"滚动中，在此计算偏移量");
    CGFloat offsetX = scrollView.contentOffset.x;
    //使用偏移量计算当前页  当前页 = （偏移量+图片一半宽度）/ 图片宽度
    int page =(offsetX+(scrollView.frame.size.width * 0.5))/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //重新启动计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}


//自动滚动方法
-(void) scrollImage{
    NSLog(@"timer run");
    //滚动一次图片
    //若当前为最后一页，就滚动到第一页
    NSInteger page = self.pageControl.currentPage;
    if(page == self.pageControl.numberOfPages - 1){
        page = 0;//回到第一页
    }else{
        page++;
    }
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    [self.pageControl setCurrentPage:page];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
