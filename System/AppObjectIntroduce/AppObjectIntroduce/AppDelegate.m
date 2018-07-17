//
//  AppDelegate.m
//  AppObjectIntroduce
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


//应用程序加载完毕
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"应用程序加载完毕");
    //创建窗口，并制定大小
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置根视图控制器
    [self.window setRootViewController:[ViewController new]];
    //设置窗口可见,并设置为应用程序的主窗口
    [self.window makeKeyAndVisible];
    return YES;
}

//应用即将变为不活跃状态(失去焦点,例如按Home键的过程)
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"应用即将变为不活跃状态(失去焦点,例如按Home键的过程)");
}

//应用程序进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"应用程序进入后台");
}

//即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"即将进入前台");
}

//应用变为活跃状态
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"应用变为活跃状态");
}

//应用即将销毁
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"应用即将销毁");
}

//应用接受到内存警告
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    NSLog(@"应用接受到内存警告");
}


@end
