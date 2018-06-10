//
//  FriendCell.h
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Friend;
@interface FriendCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;

@property (weak, nonatomic) IBOutlet UILabel *decLabel;

@property (weak, nonatomic) IBOutlet UILabel *locLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) Friend *friend;

//封装一个创建自定义cell的方法

+ (instancetype) friendCellWithTableView:(UITableView *) tableView;
@end
