//
//  ViewController.m
//  SaveAndRead
//
//  Created by Salu on 2018/7/15.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)save:(id)sender {
    //创建自定义对象
    Teacher *teacher = [Teacher new];
    teacher.name = @"边边";
    teacher.age = 18;
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *filePath = [tmpPath stringByAppendingPathComponent:@"teacher.data"];
    //归档
    [NSKeyedArchiver archiveRootObject:teacher toFile:filePath];
}

- (IBAction)read:(id)sender {
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *filePath = [tmpPath stringByAppendingPathComponent:@"teacher.data"];
    Teacher *teacher = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", teacher.name);
}
@end
