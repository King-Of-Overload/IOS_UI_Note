//
//  ViewController.m
//  GroupedTableView
//
//  Created by Alan Lu on 2016/11/01.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSArray *keys;
@property(nonatomic,strong) NSDictionary *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _keys=[[NSArray alloc] initWithObjects:@"舞见",@"主播",@"cos",@"せんせい", nil];
    NSArray *wujian=[NSArray arrayWithObjects:@"赤玖九",@"有咩酱",@"咬人猫", nil];
    NSArray *zhubo=[NSArray arrayWithObjects:@"露露",@"爱喵的奈儿酱",@"冯提莫",@"狐狸笨笨笨", nil];
    NSArray *cos=[NSArray arrayWithObjects:@"神乐坂真冬",@"海参", nil];
    NSArray *sensei=[NSArray arrayWithObjects:@"叶子老师",@"铃原エミリ", nil];
    NSArray *objects=[NSArray arrayWithObjects:wujian,zhubo,cos,sensei, nil];
    _dataSource=[[NSDictionary alloc] initWithObjects:objects forKeys:_keys];
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id key=[_keys objectAtIndex:section];
    return [[_dataSource objectForKey:key] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"basic-cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(nil==cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    id key=[_keys objectAtIndex:indexPath.section];
    NSString *text=[[_dataSource objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.text=text;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_keys count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_keys objectAtIndex:section];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text=[[_dataSource objectForKey:[_keys objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示" message:text preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"么么哒" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
