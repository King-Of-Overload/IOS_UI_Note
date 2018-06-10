//
//  CustomCellTableViewCell.h
//  SelfDefineTableView
//
//  Created by Alan Lu on 2016/11/01.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *decLabel;
@property (weak, nonatomic) IBOutlet UILabel *locLabel;

@property(copy,nonatomic)UIImage *image;
@property(copy,nonatomic)NSString *name;
@property(copy,nonatomic)NSString *dec;
@property(copy,nonatomic)NSString *loc;


@end
