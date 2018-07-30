//
//  NewsCell.h
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *digestView;
@property (weak, nonatomic) IBOutlet UILabel *replyCountView;

@property (nonatomic, strong) News *news;

@end
