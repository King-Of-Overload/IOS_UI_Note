//
//  ViewController.m
//  HelloDataTask
//
//  Created by Alan Croft on 2018/7/29.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ViewController
- (NSURLSession *) session{
    if(_session == nil){
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self dataTask1];
    //[self downloadTask];
}

//下载完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
}

//断点续传
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
    
}

//获取进度
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    NSLog(@"下载进度：%f",1.0 * totalBytesWritten / totalBytesExpectedToWrite);
}

//下载进度
- (void) downloadProcess{
    
}

//downloadtask
- (void) downloadTask{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.108:8080/MyWeb/LL3.jpg"];
    [[[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //将临时文件复制到其他位置
        NSString *doc = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"123.jpg"];
        [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:doc error:NULL];
        
    }] resume] ;
}

//简化代码
-(void) dataTask2{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.108:8080/MyWeb/demo.json"];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@", json);
    }] resume];
}

//获取json
- (void) dataTask1{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.108:8080/MyWeb/demo.json"];
    NSURLSession *session = [NSURLSession sharedSession];
    //该任务默认挂起
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@", json);
    }];
    //开始任务
    [dataTask resume];
}

@end
