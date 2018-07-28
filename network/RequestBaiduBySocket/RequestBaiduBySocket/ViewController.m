//
//  ViewController.m
//  RequestBaiduBySocket
//
//  Created by Alan Croft on 2018/7/28.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import <netinet/in.h>
#import <arpa/inet.h>

@interface ViewController ()
@property (nonatomic, assign) int clientSocket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //连接百度的服务器
    BOOL result = [self connect:@"112.80.248.76" port:80];
    if(!result){
        NSLog(@"连接失败");
        return;
    }
    NSLog(@"连接成功");
    //服务器返回的响应头
    NSString *response = [self sendAndReceive:@"GET / HTTP/1.1\r\nHost: www.baidu.com\r\nUser-Agent: Mozilla/5.0 (Linux; Android 4.4.4; en-us; Nexus 4 Build/JOP40D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2307.2 Mobile Safari/537.36\r\nConnection: close\r\n\r\n"];
    //关闭连接
    close(self.clientSocket);
    //截取响应头  \r\n\r\n
    NSRange range = [response rangeOfString:@"\r\n\r\n"];
    NSString *html = [response substringFromIndex:range.length + range.location];
    [self.webView loadHTMLString:html baseURL:[NSURL URLWithString:@"http://www.baidu.com"]];
}

-(BOOL) connect: (NSString *) ip port:(int)port{
    //创建socket 参数一：协议域 参数二：Socket类型 参数三：制订协议(0为根据二选择)
    int clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    self.clientSocket = clientSocket;
    //连接服务器 套接字描述符  结构体指针包括类型与IP   参数二的长度 sizeof
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr =inet_addr(ip.UTF8String);
    addr.sin_port = htons(port);
    int result = connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    if(result == 0){
        return YES;
    }else{
        return NO;
    }
}

- (NSString *) sendAndReceive:(NSString *) sendMsg{
    //向服务器发送数据  套接字描述符   数据  字符个数  0
    //返回实际传送的字节数，失败返回 -1
    const char *msg = sendMsg.UTF8String;
    size_t sendCount = send(self.clientSocket, msg, strlen(msg), 0);
    printf("发送的字节数：%zu \n", sendCount);
    //接收服务器的数据
    //返回的是实际接收的字节个数
    uint8_t buffer[1024];
    NSMutableData *mData = [NSMutableData data];
    size_t receiveCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    [mData appendBytes:buffer length:receiveCount];
    while (receiveCount != 0) {
        receiveCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
        [mData appendBytes:buffer length:receiveCount];
        printf("接收的字节数：%zd \n", receiveCount);
    }
    //将字节数组转换成字符串
    NSString *recvMsg = [[NSString alloc] initWithData:mData encoding:NSUTF8StringEncoding];
    return recvMsg;
}


@end
