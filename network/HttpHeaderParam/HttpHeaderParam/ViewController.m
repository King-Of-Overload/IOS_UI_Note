//
//  ViewController.m
//  HttpHeaderParam
//
//  Created by Alan Croft on 2018/7/28.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.108:8080/MyWeb/demo.json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(! connectionError){
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if(httpResponse.statusCode == 200 || httpResponse.statusCode == 304){
                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                //解析数据
                NSError *error;
                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                if(error){
                    NSLog(@"解析错误: %@",error);
                    return;
                }
                
            }
        }else{
            NSLog(@"%@", connectionError);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
