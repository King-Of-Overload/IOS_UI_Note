//
//  ViewController.m
//  PausePointDownload
//
//  Created by Alan Croft on 2018/7/29.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSURLSession *session;

@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
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
    
}

-(void) download{
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.108:8080/MyWeb/LL3.jpg"];
    NSURLSessionDownloadTask *downloadTask = [self.session downloadTaskWithURL:url];
    self.downloadTask = downloadTask;
    [downloadTask resume];
}

- (IBAction)start:(id)sender {
    [self download];
}

- (IBAction)pause:(id)sender {
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        <#code#>
    }];
}

- (IBAction)resume:(id)sender {
}
@end
