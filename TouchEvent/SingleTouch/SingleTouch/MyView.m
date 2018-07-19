//
//  MyView.m
//  SingleTouch
//
//  Created by Alan Croft on 2018/7/19.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

@implementation MyView

//点击时调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.superview];
    //让粉色view的中心等于手指位置
    [self setCenter:p];//以父控件为坐标系
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.superview];
    //获取上一个点的位置
    CGPoint lastP = [touch previousLocationInView:self.superview];
    //偏移量
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    [self setCenter: CGPointMake(self.center.x + offsetX, self.center.y+offsetY)];
}

@end
