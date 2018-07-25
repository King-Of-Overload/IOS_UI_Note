//
//  DiscoveryViewController.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "UIView+Frame.h"

@interface DiscoveryViewController ()
@property (nonatomic, weak) UIView *blueView;
@end

@implementation DiscoveryViewController

-(UIView *) blueView{
    if(_blueView == nil){
        UIView *blueView = [UIView new];
        [blueView setBackgroundColor:[UIColor blueColor]];
        [blueView setFrame:CGRectMake(0, 64, kScreenWidth, 0)];
        [self.view addSubview:blueView];
        _blueView = blueView;
    }
    return _blueView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController.navigationBar setTranslucent:NO];//设置navigation不是透明，那么左上角点会移动到导航栏下面
    [self blueView];
}
//全部彩种点击事件
- (IBAction)groupByClick:(UIButton *)sender {
    [UIView animateWithDuration:0.25 animations:^{
        [self.blueView setH:self.blueView.h? 0 : 150];
        //旋转图标
        [sender.imageView setTransform:CGAffineTransformRotate(sender.imageView.transform, M_PI)];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
