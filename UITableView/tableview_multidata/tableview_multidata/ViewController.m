//
//  ViewController.m
//  tableview_multidata
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    
}

#pragma mark - /**  method  **/
//分几组
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){//综合性大学
        return 3;
    }else if(section == 1){//理工类大学
        return 2;
    }else{//医科大学
        return 1;
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if(indexPath.section == 0){//第一组
        if(indexPath.row == 0){
            cell.textLabel.text = @"浙江大学";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"扬州大学";
        }else{
            cell.textLabel.text = @"苏州大学";
        }
    }else if (indexPath.section == 1){//第二组
        if(indexPath.row == 0){
            cell.textLabel.text = @"浙江工业大学";
        }else{
            cell.textLabel.text = @"杭州电子科技大学";
        }
    }else{//第三组
        cell.textLabel.text = @"首都医科大学";
    }
    return cell;
}

//组标题
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"综合性大学";
    }else if(section == 1){
        return @"理工类大学";
    }else{
        return @"医科大学";
    }
}

//组尾描述
-(NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(section == 0){
        return @"学科全面";
    }else if(section == 1){
        return @"理工类学科";
    }else{
        return @"医学为主";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
