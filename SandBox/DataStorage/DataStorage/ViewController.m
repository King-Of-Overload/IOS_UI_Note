//
//  ViewController.m
//  DataStorage
//
//  Created by Salu on 2018/7/15.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *home = NSHomeDirectory();
//    NSLog(@"%@",home);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveClick:(id)sender {
    //获取Documents路径
    //1.拼接字符串,不推荐使用，因为系统路径可能会更改
//    NSString *homePath = NSHomeDirectory();
//    NSString *documentPath = [homePath stringByAppendingString:@"/Documents"];
    //documentPath = [homePath stringByAppendingPathComponent:@"Documents"];
    
    //2. 通过搜索的方式 参数一：哪一个文件夹  参数二：用户类别 参数三：是否展开成完整路径
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [docPath stringByAppendingPathComponent:@"xx.plist"];
//    NSLog(@"%@", docPath);
//    NSArray *array = @[@"小缘", @"幼儿缘", @"阿猫"];
//    [array writeToFile:filePath atomically:YES];
    
    NSDictionary *dict = @{@"key":@"value"};
    [dict writeToFile:filePath atomically:YES];
}

- (IBAction)readClick:(id)sender {
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //获取文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"xx.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@", array);
}
@end
