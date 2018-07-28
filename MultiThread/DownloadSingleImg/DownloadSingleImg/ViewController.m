//
//  ViewController.m
//  DownloadSingleImg
//
//  Created by Alan Croft on 2018/7/25.
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
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];
    [thread start];
}

//下载图片
- (void) downloadImage{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://sta-op.douyucdn.cn/custom-room/ea18dbecdbfffd223d16ab901aeb6f8ae105c4bf.jpg"]];
    UIImage *img = [UIImage imageWithData:data];
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:img waitUntilDone:YES];//跳回UI线程操作
}

-(void) updateUI:(UIImage *) img{
    [_imageView setImage:img];
    [_imageView sizeToFit];
    [_scrollView setContentSize:img.size];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
