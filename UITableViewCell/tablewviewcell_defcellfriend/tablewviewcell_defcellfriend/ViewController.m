//
//  ViewController.m
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"
#import "FriendCell.h"
#import "FooterView.h"
#import "HeaderView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *friends;
@end

@implementation ViewController

-(NSMutableArray *)friends{
    if(_friends == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friendsInfo.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        int i = 1;
        for(NSDictionary *dict in arrayDict){
            Friend *friend = [Friend friendWithLoc:dict];
            friend.icon = [NSString stringWithFormat:@"%d",i];
            [arrayModels addObject:friend];
            i++;
        }
        _friends = arrayModels;
    }
    return _friends;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    [self.tableView setRowHeight:60];
    //设置footerview
    FooterView *footerView = [FooterView footerView];
    //设置footerView的代理
    [footerView setDelegate:self];
    [self.tableView setTableFooterView:footerView];
    
    //创建HeaderView
    HeaderView *headerView = [HeaderView headerView];
    [self.tableView setTableHeaderView:headerView];
}

//实现footerview的代理方法
- (void)footerViewUpdateData:(FooterView *)footerView{
    Friend *friend = [[Friend alloc] init];
    friend.icon = @"2";
    friend.name = @"小6想去月球";
    friend.dec = @"瓜皮，哪里跑";
    friend.loc = @"杭州";
    [_friends addObject:friend];
    //刷新tableview UI
    [self.tableView reloadData];
    //局部刷新此时不适用了，因为未刷新完毕就更新会出现索引问题
//    NSIndexPath *path = [NSIndexPath indexPathForRow:_friends.count - 1 inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
    NSIndexPath *path = [NSIndexPath indexPathForRow:_friends.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.friends.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Friend *friend = _friends[indexPath.row];
   
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
//    if(cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:id];
//    }
//    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",indexPath.row+1]];
//    cell.textLabel.text = friend.dec;
//    cell.detailTextLabel.text = friend.loc;
    
    //自定义cell
    //加载xib(nib)
    FriendCell *cell = [FriendCell friendCellWithTableView:tableView];
    cell.friend = friend;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
