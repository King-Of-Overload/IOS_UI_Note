//
//  GroupByButton.m
//  Loterry
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "GroupByButton.h"
#import "UIView+Frame.h"

@implementation GroupByButton

- (void)layoutSubviews{
    [super layoutSubviews];
    //交换btn内部控件的位置
//    CGRect labelRect = self.titleLabel.frame;
//    labelRect.origin.x = 0;
//    [self.titleLabel setFrame:labelRect];
    self.titleLabel.x = 0;
//    CGRect imageRect = self.imageView.frame;
//    imageRect.origin.x = labelRect.size.width;
//    [self.imageView setFrame:imageRect];
    
    self.imageView.x = self.titleLabel.w;
}

@end
