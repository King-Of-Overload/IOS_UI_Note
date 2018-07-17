//
//  ViewController.h
//  ContactBook
//
//  Created by Salu on 2018/7/14.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *rememberPwd;
@property (weak, nonatomic) IBOutlet UISwitch *autoLogin;
@end

