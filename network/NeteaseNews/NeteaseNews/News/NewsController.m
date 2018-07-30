//
//  NewsController.m
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "NewsController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsController ()

@property (nonatomic, strong) NSArray *newsList;

@end

@implementation NewsController

- (void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [News newsWithSuccess:^(NSArray *array) {
        self.newsList = array;
    } responseError:^(NSError *error) {
    }];
    
    UIWebView *webView = [UIWebView new];
    [webView stringByEvaluatingJavaScriptFromString:@"alert('hello world')"];
    
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"news"];
    [cell setNews:self.newsList[indexPath.row]];
    return cell;
}



@end
