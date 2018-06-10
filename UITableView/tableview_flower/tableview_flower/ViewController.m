//
//  ViewController.m
//  tableview_flower
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"

@interface ViewController ()
@property(nonatomic,strong) NSArray *groups;
@end

@implementation ViewController

-(NSArray *) groups{
    if(_groups == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friendsInfo.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [[NSMutableArray alloc] init];
        for(NSDictionary *dict in arrayDict){
            Friend *friend = [Friend friendWithDict:dict];
            [arrayModels addObject:friend];
        }
        _groups = arrayModels;
    }
    return _groups;
}




-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.groups.count;
}





-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Friend *friend = _groups[indexPath.row];
    NSString *id = @"reused id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:id];
    }
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",(indexPath.row+1)]];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.dec;
    return cell;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSArray *array= @[@"A",@"B",@"C"];
    return array;
}


//监听行被选中的代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Friend *friend = _groups[indexPath.row];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"编辑好友" message:friend.name delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    alertView.tag = indexPath.row;
    [alertView textFieldAtIndex:0].text = friend.name;//设置文本框文字
    [alertView show];
}

//当点击弹出框的按钮触发
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        NSString *name = [alertView textFieldAtIndex:0].text;
        Friend *friend = _groups[alertView.tag];
        friend.name = name;
        //全局刷新：[self.tableView reloadData];
        //局部刷新
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
