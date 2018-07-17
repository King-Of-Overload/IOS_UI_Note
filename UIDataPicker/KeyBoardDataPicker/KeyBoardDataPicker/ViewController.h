//
//  ViewController.h
//  KeyBoardDataPicker
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;//文本框

//懒加载控件
@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, strong) UIToolbar *toolBar;


@end

