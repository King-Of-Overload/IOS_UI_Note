//
//  ViewController.m
//  01-减法计算器
//
//  Created by Alan Lu on 29/9/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"
//延展类(扩展类)，一般用来存放只是在内部使用的方法或属性 好处：安全
@interface ViewController ()
//凡是ui空间都用weak修饰，弱引用
//用来监听按钮的点击
-(IBAction)count;
//第一个文本输入框
@property(nonatomic,weak)IBOutlet UITextField *textField1;
//第二个文本输入框
@property(nonatomic,weak)IBOutlet UITextField *textField2;
//右边的文本标签
@property(nonatomic,weak)IBOutlet UILabel *label;
@end

@implementation ViewController

-(IBAction)count{
    //NSLog(@"我看到一个美女");
    NSString *text1=self.textField1.text;
    NSString *text2=self.textField2.text;
    //相减
    int num1=[text1 intValue];
    int num2=[text2 intValue];
    int difference=0;
    if(num1>num2||num1==num2){
        difference = num1-num2;
    }else{//弹框
        //initWithTitle:表示标题
        //message:详细信息
        //delegate:代理
        //cancelButtonTitle:取消按钮文字
        //otherButtontTitles:别的按钮的文字
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"输入的信息不合理" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert show];
        
        //ios8的弹框
//        UIAlertController *alertVc=[UIAlertController alertControllerWithTitle:@"提示" message:@"输入信息不合理" preferredStyle:UIAlertControllerStyleAlert];
//        [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
//        [self presentViewController:alertVc animated:YES completion:nil];
    }
    //把相减的值显示在右边
    self.label.text=[NSString stringWithFormat:@"%d",difference];
    //退出键盘
    //第一响应者：能够叫出键盘的控件就叫第一响应者
    //第一种方法:释放第一响应者
//    [self.textField1 resignFirstResponder];
//    [self.textField2 resignFirstResponder];
    //第二种方式：结束可能成为第一响应者的父控件的编辑状态
    [self.view endEditing:YES];
}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


@end
