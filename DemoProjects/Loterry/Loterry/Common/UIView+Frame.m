//
//  UIView+Frame.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    [self setFrame:rect];
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    [self setFrame:rect];
}

- (CGFloat)y{
    return self.frame.origin.x;
}

- (void)setW:(CGFloat)w{
    CGRect rect = self.frame;
    rect.size.width = w;
    [self setFrame:rect];
}

- (CGFloat)w{
    return self.frame.size.width;
}

- (void)setH:(CGFloat)h{
    CGRect rect = self.frame;
    rect.size.height = h;
    [self setFrame:rect];
}

- (CGFloat)h{
    return self.frame.size.height;
}
@end
