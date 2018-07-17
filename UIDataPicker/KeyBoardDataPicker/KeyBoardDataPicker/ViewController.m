//
//  ViewController.m
//  KeyBoardDataPicker
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController

#pragma mark - 懒加载控件用strong
-(UIDatePicker *) datePicker{
    if(_datePicker == nil){
        //无需设置frame，系统自动占据键盘位置
        _datePicker = [UIDatePicker new];
        //日期模式
        [_datePicker setDatePickerMode:UIDatePickerModeDate];
        //本地化
        [_datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"]];
    }
    return _datePicker;
}

#pragma mark - 懒加载toolbar
//必须指定高度
-(UIToolbar *) toolBar{
    if(_toolBar == nil){
        _toolBar = [UIToolbar new];
        [_toolBar setBounds:CGRectMake(0, 0, 0, 44)];//设置高度
        //创建内部按钮
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
        //弹簧
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        //确认按钮
        UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(confirmClick)];
        NSArray *items = @[cancelItem, flexSpace, confirmItem];
        [_toolBar setItems: items];//添加按钮
    }
    return _toolBar;
}
//取消按钮调用
-(void) cancelClick{
    //隐藏键盘
    [self.view endEditing:YES];
}
//确认按钮调用
-(void) confirmClick{
    //关闭键盘并获取值
    //获取日期
    NSDate *date = _datePicker.date;
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy年MM月dd日"];//设置格式
    NSString *dateStr = [formatter stringFromDate:date];
    //赋值
    [self.textField setText:dateStr];
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置文本框的输入界面为datepicker
    [self.textField setInputView:self.datePicker];
    //设置输入框的工具栏
    [self.textField setInputAccessoryView:self.toolBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
