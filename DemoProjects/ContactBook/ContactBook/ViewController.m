//
//  ViewController.m
//  ContactBook
//
//  Created by Salu on 2018/7/14.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"通讯录"];
    //[self.usernameField setDelegate:self];
    
    
    [self.usernameField setText:@"1"];
    [self.passwordField setText:@"1"];
    
    [self.usernameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self textChange];
    
    [self.rememberPwd addTarget:self action:@selector(rememberPassword:) forControlEvents:UIControlEventValueChanged];
    
    [self.autoLogin addTarget:self action:@selector(autoLogins:) forControlEvents:UIControlEventValueChanged];
}


//switch值发生改变调用
- (void) rememberPassword: (UISwitch *) sender{
    if(sender.isOn){
        [self.autoLogin setOn:YES animated:YES];
    }else{
        [self.autoLogin setOn:NO animated:YES];
    }
    
}

-(void) autoLogins: (UISwitch *) sender{
    if(sender.isOn){//打开
        [self.rememberPwd setOn:YES animated:YES];
    }else{
        [self.rememberPwd setOn:NO animated:YES];
    }
}

//编辑内容发生时调用
-(void) textChange{
    if(self.usernameField.text.length > 0 && self.passwordField.text.length > 0){
        [self.loginBtn setEnabled:YES];
    }else{
        [self.loginBtn setEnabled:NO];
    }
}


-(void) loginClick{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [hud.label setText:@"正在登录"];
    /*
     MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     hud.mode = MBProgressHUDModeAnnularDeterminate;
     hud.label.text = @"Loading";
     */
    //延迟方法
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if([self.usernameField.text isEqualToString:@"1"] &&
           [self.passwordField.text isEqualToString:@"1"]){
            //[self performSegueWithIdentifier:<#(nonnull NSString *)#> sender:<#(nullable id)#>];
            
            //跳转到下一个界面
            UINavigationController *controller = self.navigationController;
            TableViewController *next = [TableViewController new];
            [next.navigationItem setTitle:[NSString stringWithFormat:@"%@的联系人",self.usernameField.text]];
            [controller pushViewController:next animated:YES];
            [hud hideAnimated:YES];
        }else{
            //提示错误消息
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [hud setMode:MBProgressHUDModeDeterminate];
            [hud.label setText:@"登录失败"];
        }
    });
    
    
}


//返回NO，文本内容不能改变
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    return YES;
//}

////文本框成为第一响应者的时候调用
//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
