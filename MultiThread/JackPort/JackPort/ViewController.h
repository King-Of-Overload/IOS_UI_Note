//
//  ViewController.h
//  JackPort
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *numberOne;

@property (weak, nonatomic) IBOutlet UILabel *numberTwo;
@property (weak, nonatomic) IBOutlet UILabel *numberThree;
- (IBAction)btnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

