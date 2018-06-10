//
//  FooterView.m
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

 //加载更多按钮单击事件
- (IBAction)loadMoreClick:(id)sender {
    //hide load btn
    self.loadMoreBtn.hidden = YES;
    self.waitingView.hidden = NO;
    //延迟1s执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //调用代理之前为了保证调用不出错，要先判断代理对象是否真的实现了这个方法，若实现了，再调用，否则不调用
        if([self.delegate respondsToSelector:@selector(footerViewUpdateData:)]){
            [self.delegate footerViewUpdateData:self];
        }
        self.loadMoreBtn.hidden = NO;
        self.waitingView.hidden = YES;
    });
    
}

+ (instancetype)footerView{
    FooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] firstObject];
    return footerView;
}
@end
