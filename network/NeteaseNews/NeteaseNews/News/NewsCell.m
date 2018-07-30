//
//  NewsCell.m
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+AFNetworking.h"
#import "News.h"
@implementation NewsCell

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%f,%f",self.bounds.size.width, self.bounds.size.height);
}

- (void)setNews:(News *)news{
    [self.imgsrcView setImageWithURL:[NSURL URLWithString: news.imgsrc]];
    [self.titleView setText:news.title];
    [self.digestView setText:news.digest];
    [self.replyCountView setText:[NSString stringWithFormat:@"%d人回帖", news.replyCount.intValue]];
}

@end
