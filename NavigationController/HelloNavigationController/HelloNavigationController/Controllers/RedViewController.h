//
//  RedViewController.h
//  HelloNavigationController
//
//  Created by Salu on 2018/7/10.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)goToGreenClick:(id)sender;
@end
