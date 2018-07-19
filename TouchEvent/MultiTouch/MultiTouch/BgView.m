//
//  BgView.m
//  MultiTouch
//
//  Created by Alan Croft on 2018/7/19.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "BgView.h"

@implementation BgView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self addSpark:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self addSpark:touches];
    
}

- (void) addSpark: (NSSet *) touches{
    for (UITouch *touch in touches) {
        CGPoint p = [touch locationInView:self];
        //在该位置添加imageview
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spark_blue"]];
        //设置iv中心
        [imageView setCenter:p];
        [self addSubview:imageView];
        //动画
        [UIView animateWithDuration:2 animations:^{
            [imageView setAlpha:0];
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
        }];
    }
    
}

@end
