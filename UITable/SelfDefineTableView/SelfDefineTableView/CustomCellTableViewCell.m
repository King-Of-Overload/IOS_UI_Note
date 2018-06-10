//
//  CustomCellTableViewCell.m
//  SelfDefineTableView
//
//  Created by Alan Lu on 2016/11/01.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "CustomCellTableViewCell.h"

@implementation CustomCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setImage:(UIImage *)image{
    if(![image isEqual:_image]){
        _image=[image copy];
        self.imageView.image=_image;
    }
}

-(void)setName:(NSString *)name{
    if(![name isEqualToString:_name]){
        _name=[name copy];
        self.nameLabel.text=_name;
    }
}

-(void)setDec:(NSString *)dec{
    if(![dec isEqualToString:_dec]){
        _dec=[dec copy];
        self.decLabel.text=_dec;
    }
}

-(void)setLoc:(NSString *)loc{
    if(![loc isEqualToString:_loc]){
        _loc=[loc copy];
        self.locLabel.text=_loc;
    }
}


@end
