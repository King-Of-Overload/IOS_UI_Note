//
//  TableViewController.m
//  ContactBook
//
//  Created by Salu on 2018/7/14.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "TableViewController.h"
#import "AddContactViewController.h"
#import "Contact.h"
@interface TableViewController ()
@property (nonatomic, strong) NSMutableArray *contacts;
@end

@implementation TableViewController

-(NSMutableArray *) contacts{
    if(_contacts == nil){
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationItem setTitle:@"联系人"];
    //添加标题栏按钮
    //添加左上角注销按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(resignClick)];
    [self.navigationItem setLeftBarButtonItem:item];
    //添加右上角添加按钮
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addContact)];
    [self.navigationItem setRightBarButtonItem:add];
}

//点击delete按钮时调用
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.contacts removeObjectAtIndex:indexPath.row];
    //该方法会调用数据源方法
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    
}


-(void) addContact{
    UIStoryboard *addBoard = [UIStoryboard storyboardWithName:@"AddContact" bundle:nil];
    AddContactViewController *destination = [addBoard instantiateViewControllerWithIdentifier:@"addContact"];
    //设置代理
    destination.delegate = self;
    [self.navigationController pushViewController:destination animated:YES];
}

//代理方法
- (void)addContactViewController:(AddContactViewController *)addViewController withContact:(Contact *)contact{
    //NSLog(@"%@----%@",contact.name, contact.number);
    //加入数组当中
    [self.contacts addObject:contact];
    
    //reload
    [self.tableView reloadData];
}

//注销操作
- (void) resignClick{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"123" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){//点击注销
        [self.navigationController popViewControllerAnimated:YES];//返回上一个控制器
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

//cell内容
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"contact";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell.textLabel setText:[self.contacts[indexPath.row] name]];
        [cell.detailTextLabel setText:[self.contacts[indexPath.row] number]];
    }
    return cell;
}

@end
