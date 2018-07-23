//
//  RotateView.m
//  LuckyCircle
//
//  Created by Alan Croft on 2018/7/23.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "RotateView.h"

@implementation RotateView

+ (instancetype) rotateView{
    return [[NSBundle mainBundle] loadNibNamed:@"RotateView" owner:nil options:nil][0];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}
//创建十二宫按钮
- (void)awakeFromNib{
    [super awakeFromNib];
    for (int i = 0; i < 12; i++) {
        UIButton *btn = [UIButton new];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setFrame:CGRectMake(0, 0, 68, 143)];
        [btn setCenter:self.center];
        //设置锚点
        [btn.layer setAnchorPoint:CGPointMake(0.5, 1)]; //0 -- 1
        [self.rotateOptionView addSubview:btn];
    }
}




@end
