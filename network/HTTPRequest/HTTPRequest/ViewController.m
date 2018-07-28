//
//  ViewController.m
//  HTTPRequest
//
//  Created by Alan Croft on 2018/7/27.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //发送请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //响应
        //数据
        //连接错误
        if(!connectionError){
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //webview 加载
            [self.webView loadHTMLString:html baseURL:nil];
            //NSLog(@"%@", html);
        }else{
            NSLog(@"连接错误");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
