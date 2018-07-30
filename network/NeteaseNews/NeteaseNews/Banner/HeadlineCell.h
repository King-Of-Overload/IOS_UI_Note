//
//  HeadlineCell.h
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Headline.h"

@interface HeadlineCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) Headline *headline;

@end
