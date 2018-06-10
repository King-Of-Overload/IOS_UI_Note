//
//  AppView.m
//  01-应用管理
//
//  Created by Alan Lu on 1/10/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import "AppView.h"
#import "AppModel.h"
@interface AppView()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)downLoad:(UIButton *)sender;


@end

@implementation AppView

+(instancetype)loadView{
    return [[[NSBundle mainBundle] loadNibNamed:@"appView" owner:nil options:nil] lastObject];
}

-(void)setAppModel:(AppModel *)appModel{
    _appModel=appModel;
    self.headView.image=[UIImage imageNamed:appModel.icon];
    self.nameLabel.text=appModel.name;
}

- (IBAction)downLoad:(UIButton *)btn {
    //让按钮不能点击
    [btn setEnabled:NO];
    //创建一个用来显示信息的label
    UILabel *msgLabel=[UILabel new];
    //设置位置
    CGFloat msgLabelW=100;
    CGFloat msgLabelX=(self.superview.frame.size.width-msgLabelW)*0.5;
    CGFloat msgLabelH=30;
    CGFloat msgLabelY=(self.superview.frame.size.height-msgLabelH)*0.5;
    [msgLabel setFrame:CGRectMake(msgLabelX, msgLabelY, msgLabelW, msgLabelH)];
    [self.superview addSubview:msgLabel];
    [msgLabel setAlpha:0.6];
    [msgLabel setText:@"正在下载"];
    [msgLabel setTextAlignment:NSTextAlignmentCenter];
    [msgLabel setTextColor:[UIColor redColor]];
    //设置圆角
    msgLabel.layer.cornerRadius=8;
    //将多余的部分切掉
    msgLabel.layer.masksToBounds=YES;
    //设置动画
    [UIView animateWithDuration:2.0 animations:^{
        [msgLabel setBackgroundColor:[UIColor blackColor]];
        msgLabel.alpha=0.6;
    } completion:^(BOOL finished) {
        if(finished){
            [UIView animateWithDuration:2.0 delay:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
                msgLabel.alpha=0.0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [msgLabel removeFromSuperview];
                    return;
                }
            }];
        }
    }];
}
@end
