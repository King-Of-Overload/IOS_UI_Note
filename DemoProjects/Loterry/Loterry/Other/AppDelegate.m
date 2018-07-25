//
//  AppDelegate.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/23.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //判断沙盒版本号与当前版本号是否一致，一致应该显示tabbar，不一致显示新特性页面
    if([[self loadSavedAppVersion] isEqualToString:[self loadCurrentAppVersion]]){
        //显示tabbar
    }else{
        //新特性
    }
    //创建window
    self.window = [[UIWindow alloc] initWithFrame: kScreenSize];
    //创建底部导航控制器
    MyTabBarController *tabbarController = [MyTabBarController new];
    //根控制器
    [self.window setRootViewController:tabbarController];
    [self.window makeKeyAndVisible];
    //把当前版本保存到沙盒当中
    [self saveAppVersion];
    
    return YES;
}

//获取当前版本号
-(NSString *) loadCurrentAppVersion{
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    NSString *versionCode = info[@"CFBundleShortVersionString"];
    return versionCode;
}

//获取沙盒版本号
-(NSString *) loadSavedAppVersion{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:@"appVersion"];
}

//将当前的版本号保存到沙盒
-(void) saveAppVersion{
    //获取当前版本号
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    NSString *versionCode = info[@"CFBundleShortVersionString"];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:versionCode forKey:@"appVersion"];
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
