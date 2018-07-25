//
//  MyTabBarController.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/23.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyTabBarView.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建tab的子控制器
    UIViewController *HallVC = [self loadSubViewControllersWithName:@"Hall"];
    UIViewController *ArenaVC = [self loadSubViewControllersWithName:@"Arena"];
    UIViewController *DiscoveryVC = [self loadSubViewControllersWithName:@"Discovery"];
    UIViewController *HistoryVC = [self loadSubViewControllersWithName:@"History"];
    UIViewController *MyLotteryVC = [self loadSubViewControllersWithName:@"MyLottery"];
    [self setViewControllers:@[HallVC, ArenaVC, DiscoveryVC, HistoryVC, MyLotteryVC]];
    
    //设置自定义tabbar样式
    MyTabBarView *tabbarView = [MyTabBarView new];
    //添加block
    [tabbarView setTabbarButtonBlock:^(NSInteger index) {
        [self setSelectedIndex:index];
    }];
    //[tabbarView setFrame:self.tabBar.frame];
    [tabbarView setFrame:self.tabBar.bounds];
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *nameChoosed = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        UIImage *image = [UIImage imageNamed:name];
        UIImage *imageSelect = [UIImage imageNamed:nameChoosed];
        [tabbarView addButtonWithImage:image andImageSelect:imageSelect];
    }
    [self.tabBar addSubview:tabbarView];//将自定义的tabbar添加到系统tabbar内
}


- (UIViewController *) loadSubViewControllersWithName: (NSString *) name{
    //获取storyboard对象
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *controller = [storyboard instantiateInitialViewController];
    return controller;
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
