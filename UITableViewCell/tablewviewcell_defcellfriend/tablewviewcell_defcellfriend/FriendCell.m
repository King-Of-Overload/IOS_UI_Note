//
//  FriendCell.m
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "FriendCell.h"
#import "Friend.h"
@implementation FriendCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setFriend:(Friend *)friend{
    _friend = friend;
    //inject data
    self.imageViewIcon.image = [UIImage imageNamed:friend.icon];
    self.decLabel.text = friend.dec;
    self.nameLabel.text = friend.name;
    self.locLabel.text = friend.loc;
}

+ (instancetype) friendCellWithTableView:(UITableView *)tableView{
    static NSString *id = @"friend_cell";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FriendCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

@end
