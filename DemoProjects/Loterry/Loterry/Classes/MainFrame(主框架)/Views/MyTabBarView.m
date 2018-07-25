//
//  MyTabBarView.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyTabBarView.h"
#import "MyTabBarButton.h"

@implementation MyTabBarView

- (void)addButtonWithImage:(UIImage *)image andImageSelect:(UIImage *)imageSelect{
    MyTabBarButton *tabbarButton = [MyTabBarButton new];
    //设置图片

    [tabbarButton setBackgroundImage:image forState:UIControlStateNormal];
    [tabbarButton setBackgroundImage:imageSelect forState:UIControlStateSelected];
    //监听Btn
    [tabbarButton addTarget:self action:@selector(tabbarBtnClick:) forControlEvents:UIControlEventTouchDown];//按下就执行
    [self addSubview:tabbarButton];
}

-(void) layoutSubviews{
    [super layoutSubviews];
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *tabbarButton = self.subviews[i];
        [tabbarButton setTag:i];
        CGFloat w = kScreenWidth / 5;
        CGFloat h = 49;
        CGFloat x = i * w;
        CGFloat y = 0;
        [tabbarButton setFrame:CGRectMake(x, y, w, h)];
        if(i == 0){
            [self tabbarBtnClick:tabbarButton];//点一下
        }
    }
    
}

//点击底部按钮触发
-(void) tabbarBtnClick: (UIButton *) sender{
    [self.currentBtn setSelected:NO];
    [sender setSelected:YES];
    self.currentBtn = sender;
    if(self.tabbarButtonBlock){//执行block
        //切换控制器
        self.tabbarButtonBlock(sender.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
