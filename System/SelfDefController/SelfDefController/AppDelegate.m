//
//  AppDelegate.m
//  SelfDefController
//
//  Created by Salu on 2018/7/10.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"
#import "XibViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //创建根视图控制器
//    //1、代码创建
//    [self.window setRootViewController:[TableViewController new]];
    //2、故事画板创建：加载故事画板文件，从画板文件中实例化controller
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];//nil为mainBundle
//    //实例化控制器
//    UIViewController *storyController = [storyBoard instantiateInitialViewController];
//    [self.window setRootViewController:storyController];
    
    //通过Xib创建
//    XibViewController *controller = [[XibViewController alloc] initWithNibName:@"XibView" bundle:nil];
//    [self.window setRootViewController:controller];
    //名称与控制器的类名相似
//    XibViewController *controller = [XibViewController new];
//    [self.window setRootViewController:controller];
    //名称与控制器的类名完全一致
    //作为主窗口并可见
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
