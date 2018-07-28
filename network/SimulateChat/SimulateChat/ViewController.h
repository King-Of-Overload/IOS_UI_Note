//
//  ViewController.h
//  SimulateChat
//
//  Created by Alan Croft on 2018/7/28.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *addressField;

@property (weak, nonatomic) IBOutlet UITextField *portField;

- (IBAction)connectClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *sendMsgField;
@property (weak, nonatomic) IBOutlet UILabel *receiveMsgLabel;
- (IBAction)sendClick:(id)sender;
- (IBAction)closeClick:(id)sender;
@end

