//
//  RotateView.h
//  LuckyCircle
//
//  Created by Alan Croft on 2018/7/23.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotateView : UIView <UIAlertViewDelegate>

+ (instancetype) rotateView;

@property (weak, nonatomic) IBOutlet UIImageView *rotateOptionView;

-(void) startRotate;
- (IBAction)pickNumber:(UIButton *)sender;
@end
