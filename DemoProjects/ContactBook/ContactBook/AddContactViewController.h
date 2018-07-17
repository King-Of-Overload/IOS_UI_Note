//
//  AddContactViewController.h
//  ContactBook
//
//  Created by Salu on 2018/7/14.
//  Copyright © 2018年 zjut. All rights reserved.
//
#import <UIKit/UIKit.h>
@class AddContactViewController;
#import "Contact.h"
@protocol AddContactViewControllerDelegate <NSObject>

-(void) addContactViewController: (AddContactViewController *)addViewController withContact:(Contact *) contact;

@end

@interface AddContactViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, weak) id<AddContactViewControllerDelegate> delegate;

@end
