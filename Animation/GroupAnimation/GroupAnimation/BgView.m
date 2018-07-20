//
//  BgView.m
//  GroupAnimation
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "BgView.h"

@implementation BgView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path stroke];
}


@end
