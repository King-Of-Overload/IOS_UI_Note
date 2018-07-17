//
//  FlagView.h
//  KuniFlag
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Flag;
@interface FlagView : UIView

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (nonatomic, strong) Flag *flag;//绑定模型
@end
