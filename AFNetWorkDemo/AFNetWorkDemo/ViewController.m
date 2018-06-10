//
//  ViewController.m
//  AFNetWorkDemo
//
//  Created by Alan Lu on 25/10/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Data.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,DataDelegate>
@property (nonatomic,strong)UITableView *myTableView;
@property (nonatomic, strong) NSArray *myArray;//用来存放JSON数据的数组
@property (nonatomic, strong) Data *myData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myArray];
    [self myData];
    [self myTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Data *)myData{
    if(!_myData){
        _myData=[Data new];
        _myData.delegate=self;
        [_myData getData];
    }
    return _myData;
}

 - (NSArray *) myArray{
 if (!_myArray) {
 _myArray = [[NSArray alloc ] init];
 }
 return _myArray;
 }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.myArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (self.myArray != nil && self.myArray.count > 0) {
        cell.textLabel.text = [self.myArray objectAtIndex:[indexPath row]];
    }
    return cell;
}


 - (UITableView *) myTableView{
 if (!_myTableView) {
 _myTableView = [[UITableView alloc] initWithFrame:self.view.frame];
 _myTableView.dataSource = self;
 _myTableView.delegate = self;
 [self.view addSubview: _myTableView];
 }
 return _myTableView;
 }

- (void)data:(NSMutableArray *)array{
    self.myArray = array;
    [self.myTableView reloadData];
}
@end
