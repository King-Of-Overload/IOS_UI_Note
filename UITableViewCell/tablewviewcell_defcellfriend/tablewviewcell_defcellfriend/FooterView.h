//
//  FooterView.h
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FooterView;
//创建代理协议
@protocol FooterViewDelegate <NSObject>

@required
- (void)footerViewUpdateData:(FooterView *) footerView;

@end


@interface FooterView : UIView

@property (weak, nonatomic) IBOutlet UIButton *loadMoreBtn;

@property (weak, nonatomic) IBOutlet UIView *waitingView;

@property (nonatomic, weak) id<FooterViewDelegate> delegate;//声明代理对象,UI控件代理必须使用weak


- (IBAction)loadMoreClick:(id)sender;

+ (instancetype)footerView;

@end


