//
//  AppView.h
//  01-应用管理
//
//  Created by Alan Lu on 1/10/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppModel;
@interface AppView : UIView
@property(nonatomic,strong)AppModel *appModel;

+(instancetype)loadView;
@end
