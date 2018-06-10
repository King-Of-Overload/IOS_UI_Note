//
//  ViewController.m
//  tableview_loadPlist
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"

@interface ViewController ()

@property(nonatomic,strong)NSArray *groups;
@end

@implementation ViewController


#pragma mark - lazy load
-(NSArray *)groups{
    if(_groups == nil){
        //load
        //get plist
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars.plist" ofType:nil];
        //load plist
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        //convert array to object
        NSMutableArray *arrayModel = [NSMutableArray array];
        //iterator
        for(NSDictionary *dict in arrayDict){
            CarGroup *model = [CarGroup groupWithDict:dict];
            [arrayModel addObject:model];
        }
        _groups = arrayModel;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CarGroup *group = self.groups[section];
    return group.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //get model data
    CarGroup *group = self.groups[indexPath.section];
    NSString *brand = group.cars[indexPath.row];
    //声明重用id
    NSString *id = @"reused cell";
    //缓存池查询cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if(cell == nil){
        //cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    cell.textLabel.text = brand;
    return cell;
}

#pragma mark --- hide status bar

-(BOOL)prefersStatusBarHidden{
    return YES;
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarGroup *group = _groups[section];
    NSString *title = group.title;
    return title;
}

-(NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CarGroup *group = _groups[section];
    return group.desc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
