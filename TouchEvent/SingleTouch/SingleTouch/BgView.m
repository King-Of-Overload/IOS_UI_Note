//
//  BgView.m
//  SingleTouch
//
//  Created by Alan Croft on 2018/7/19.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "BgView.h"
#import "MyView.h"

@implementation BgView

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    CGPoint lastP = [touch previousLocationInView:self];
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    [self.myView setCenter:CGPointMake(self.myView.center.x + offsetX, self.myView.center.y + offsetY)];
    
}

@end
