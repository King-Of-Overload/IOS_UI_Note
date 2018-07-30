//
//  ViewController.h
//  SimulateLogin
//
//  Created by Alan Croft on 2018/7/29.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

@end

