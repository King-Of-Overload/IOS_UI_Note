//
//  ViewController.m
//  SAXParse
//
//  Created by Alan Croft on 2018/7/29.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"

@interface ViewController ()
@property (nonatomic ,strong) NSMutableArray *videos;

@property (nonatomic, strong) Video *currentVideo;

@property (nonatomic, copy) NSMutableString *mString;//节点的内部内容，需要拼接
@end

@implementation ViewController

-(NSMutableArray *) videos{
    if(_videos == nil){
        _videos = [NSMutableArray array];
    }
    return _videos;
}

- (NSMutableString *) mString{
    if(_mString == nil){
        _mString = [NSMutableString string];
    }
    return _mString;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.108:8080/MyWeb/videos.xml"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(! connectionError){
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if(httpResponse.statusCode == 200 || httpResponse.statusCode == 304){
                //解析xml
                NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
                //设置代理
                [parser setDelegate:self];
                [parser parse];
            }
        }else{
            NSLog(@"%@", connectionError);
        }
    }];
}

//开始解析文档
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    
}

//找开始节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    //elementName 节点名称
    //attributeDict 标签的属性
    if([elementName isEqualToString:@"video"]){
        self.currentVideo = [Video new];
        [self.currentVideo setVideoId:@(attributeDict[@"videoId"].intValue)];
        //添加到数组中
        [self.videos addObject:self.currentVideo];
    }
}

//节点之间的内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [self.mString appendString:string];
}

//找结束节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //elementName 节点名称
    if([elementName isEqualToString:@"name"]){
        [self.currentVideo setName:self.mString];
    }else if([elementName isEqualToString:@"length"]){
        [self.currentVideo setLength:@(self.mString.intValue)];
    }else if([elementName isEqualToString:@"videoURL"]){
        [self.currentVideo setVideoURL:self.mString];
    }else if([elementName isEqualToString:@"imageURL"]){
        [self.currentVideo setImageURL:self.mString];
    }else if([elementName isEqualToString:@"desc"]){
        [self.currentVideo setDesc:self.mString];
    }else if([elementName isEqualToString:@"teacher"]){
        [self.currentVideo setTeacher:self.mString];
    }
    //清空可变字符串
    [self.mString setString:@""];
}

//结束解析文档
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    for (Video *v in self.videos) {
        NSLog(@"%@, %@, %@, %@, %@, %@", v.name,v.length,v.videoURL,v.imageURL,v.desc,v.teacher);
    }
}
//发生错误
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    
}


@end
