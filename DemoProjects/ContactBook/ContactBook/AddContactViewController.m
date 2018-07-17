//
//  AddContactViewController.m
//  ContactBook
//
//  Created by Salu on 2018/7/14.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "AddContactViewController.h"
#import "Contact.h"

@interface AddContactViewController ()

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"添加联系人"];
    [self.navigationItem.leftBarButtonItem setTitle:@"返回"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
}

//添加按钮点击事件
-(void) addClick{
    //判断代理方法是不是响应
    if([self.delegate respondsToSelector:@selector(addContactViewController:withContact:)]){
        //如果响应，执行代理方法
        Contact *contact = [Contact new];
        contact.name = self.nameField.text;
        contact.number = self.phoneField.text;
        [self.delegate addContactViewController:self withContact:contact];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


-(void) textChange{
    [self.addBtn setEnabled:self.nameField.text.length > 0 && self.phoneField.text.length > 0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
