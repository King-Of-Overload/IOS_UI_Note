//
//  main.c
//  HelloSocket
//
//  Created by Alan Croft on 2018/7/27.
//  Copyright © 2018年 zjut. All rights reserved.
//

#include <stdio.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h> // for open
#include <unistd.h> // for close

int main(int argc, const char * argv[]) {
    //创建socket 参数一：协议域 参数二：Socket类型 参数三：制订协议(0为根据二选择)
    int clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    //连接服务器 套接字描述符  结构体指针包括类型与IP   参数二的长度 sizeof
    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr =inet_addr("127.0.0.1");
    addr.sin_port = htons(12345);
    int result = connect(clientSocket, (const struct sockaddr *)&addr, sizeof(addr));
    if(result != 0){
        printf("%s", "失败");
        return 0;
    }
    //向服务器发送数据  套接字描述符   数据  字符个数  0
    //返回实际传送的字节数，失败返回 -1
    const char *msg = "幼儿缘";
    size_t sendCount = send(clientSocket, msg, strlen(msg), 0);
    printf("发送的字节数：%zu \n", sendCount);
    //接收服务器的数据
    //返回的是实际接收的字节个数
    uint8_t buffer[1024];
    size_t receiveCount = recv(clientSocket, buffer, sizeof(buffer), 0);
    printf("接收的字节数：%zd \n", receiveCount);
    //将字节数组转换成字符串
    char *destArr;
    destArr = (char *)malloc(sizeof(char) * (sizeof(buffer)+1));
    strncpy(destArr, (char *)buffer, sizeof(buffer));
    printf("%s", destArr);
    //关闭连接
    close(clientSocket);
    return 0;
}
