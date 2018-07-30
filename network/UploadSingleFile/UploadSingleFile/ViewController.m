//
//  ViewController.m
//  UploadSingleFile
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


-(void) uploadSingleFile{
    NSURL *url = [NSURL URLWithString:<#urlStr#>];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    
    [request setHTTPMethod:@"post"];
    //设置请求头
    [request setValue:@"multipart/form-data; boundary=自定义分隔符" forHTTPHeaderField:@"Content-Type"];
    //设置请求体
    NSMutableString *str = [NSMutableString string];
    [str appendFormat:@"--%@\r\n",@"abc"];
    [str appendString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"01.jpg\"\r\n"];
    [str appendString:@"Content-Type: image/jpeg\r\n\r\n"];
    NSMutableData *mData = [NSMutableData new];
    [mData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    //添加文件二进制数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"文件名.jpg" ofType:nil];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    [mData appendData:fileData];
    //添加尾部
    NSString *end = [NSString stringWithFormat:@"\r\n--%@--",@"abc"];
    [mData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:mData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(! connectionError){
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if(httpResponse.statusCode == 200 || httpResponse.statusCode == 304){
                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                //解析数据
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
