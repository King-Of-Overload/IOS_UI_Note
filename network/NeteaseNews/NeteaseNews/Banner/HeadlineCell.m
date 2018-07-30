//
//  HeadlineCell.m
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "HeadlineCell.h"
#import "UIImageView+AFNetworking.h"
#import "Headline.h"

@implementation HeadlineCell

//重写set方法
- (void)setHeadline:(Headline *)headline{
    _headline = headline;
    //解决重用
    [self.imgsrcView setImage:nil];
    [self.titleView setText:nil];
    [self.imgsrcView setImageWithURL:[NSURL URLWithString:headline.imgsrc]];
    [self.titleView setText:headline.title];
    [self.pageControl setCurrentPage:self.tag];//设置当前图片
}
@end
