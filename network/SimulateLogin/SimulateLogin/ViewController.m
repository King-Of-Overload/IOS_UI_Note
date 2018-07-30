//
//  ViewController.m
//  SimulateLogin
//
//  Created by Alan Croft on 2018/7/29.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)login:(id)sender {
    [self goLogin:self.usernameField.text password:self.passwordField.text];
}



- (void) goLogin: (NSString *) username password: (NSString *) password{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.108:8080/MyWeb/LoginServlet"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    [request setHTTPMethod:@"post"];
    [request setHTTPBody:[[NSString stringWithFormat:@"username=%@&password=%@",username,password] dataUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(! connectionError){
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if(httpResponse.statusCode == 200 || httpResponse.statusCode == 304){
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
                if([dic[@"userId"] isEqualToString:@"幼儿缘"]){
                    NSLog(@"登录成功");
                }else{
                    NSLog(@"登录失败");
                }
            }
        }else{
            NSLog(@"%@", connectionError);
        }
    }];
}
@end
