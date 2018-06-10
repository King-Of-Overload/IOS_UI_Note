//
//  Data.m
//  AFNetWorkDemo
//
//  Created by Alan Lu on 25/10/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "Data.h"
#import "AFNetworking.h"

@implementation Data
-(void)getData{
    __block NSMutableArray *result=[NSMutableArray new];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    //在数组里添加请求参数
    params[@"key"]=@"44d899b0b00a91f7d7a16cf493c4cecf";
    params[@"lng"]=@"119.400733";
    params[@"lat"]=@"32.377931";
    //创建请求管理者
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    //发送请求,使用get，请求成功后返回的数据会放在responseObject中
    [manager GET:@"http://apis.juhe.cn/catering/query" parameters:params  success:^(NSURLSessionDataTask *task,id responseObject){
        //新建一个字典来存放返回的数据
        NSMutableDictionary *dataSource=[responseObject mutableCopy];
        //再返回的字典当中，将关键字result索引到的数据存放到另外一个数组中
        NSArray *resultArray=[dataSource objectForKey:@"result"];
        //遍历resultArray数组得到navigation对应的数据，并存放到result数组中
        for(NSDictionary *dic in resultArray){
            NSString *navigation=[dic objectForKey:@"navigation"];
            [result addObject:navigation];
        }
        [self.delegate data:result];
    } failure:^(NSURLSessionDataTask *task,NSError *error){
        NSLog(@"%@",error);
    }];
    
}

@end
