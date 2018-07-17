//
//  FlagView.m
//  KuniFlag
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"
@implementation FlagView

-(void)setFlag:(Flag *)flag{
    _flag = flag;
    [self.nameLabel setText: flag.name];
    [self.iconImage setImage:[UIImage imageNamed:flag.icon]];
}

@end
