//
//  ViewController.m
//  TableViewApp
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "AppInfoCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *appInfos;

@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation ViewController
- (NSArray *) appInfos{
    if(_appInfos == nil){
        _appInfos = [AppInfo appInfos];
    }
    return _appInfos;
}
-(NSOperationQueue *) queue{
    if(_queue == nil){
        _queue = [NSOperationQueue new];
    }
    return _queue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    //NSLog(@"%@",[self appInfos]);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.appInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"appinfo";
    AppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[AppInfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    AppInfo *info = self.appInfos[indexPath.row];
    [cell.textLabel setText:info.name];
    [cell.detailTextLabel setText:info.download];
    //判断有没有图片缓存
    if(info.image != nil){
        [cell.imageView setImage:info.image];
        return cell;
    }
    //设置占位图片
    [cell.imageView setImage:[UIImage imageNamed:@"ic_favorite_box_default_large"]];
    //同步下载图片
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:info.icon]];
//    UIImage *image = [UIImage imageWithData:data];
//    [cell.imageView setImage:image];
    //异步下载
    [self.queue addOperationWithBlock:^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:info.icon]];
        UIImage *image = [UIImage imageWithData:data];
        //缓存图片到内存
        [info setImage:image];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //[cell.imageView setImage:image];
            //解决图片显示错位问题
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
    }];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
