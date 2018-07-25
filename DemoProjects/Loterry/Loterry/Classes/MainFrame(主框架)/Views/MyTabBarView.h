//
//  MyTabBarView.h
//  Loterry
//
//  Created by Alan Croft on 2018/7/24.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarView : UIView

@property (nonatomic, weak) UIButton *currentBtn;

- (void) addButtonWithImage:(UIImage *) image andImageSelect:(UIImage *) imageSelect;

@property (nonatomic, copy) void(^tabbarButtonBlock)(NSInteger);
@end
