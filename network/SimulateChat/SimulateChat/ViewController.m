//
//  ViewController.m
//  SimulateChat
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
    // Do any additional setup after loading the view, typically from a nib.
}
//连接
- (IBAction)connectClick:(id)sender {
    [self connect:self.addressField.text port:self.portField.text.intValue];
}
//发送与接收
- (IBAction)sendClick:(id)sender {
    self.receiveMsgLabel.text = [self sendAndReceive:self.sendMsgField.text];
}
//关闭
- (IBAction)closeClick:(id)sender {
    close(_clientSocket);
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
    size_t receiveCount = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    printf("接收的字节数：%zd \n", receiveCount);
    //将字节数组转换成字符串
    char *destArr;
    destArr = (char *)malloc(sizeof(char) * (sizeof(buffer)+1));
    strncpy(destArr, (char *)buffer, sizeof(buffer));
    return [NSString stringWithUTF8String:destArr];
}



@end
