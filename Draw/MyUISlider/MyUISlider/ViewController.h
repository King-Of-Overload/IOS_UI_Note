//
//  ViewController.h
//  MyUISlider
//
//  Created by Salu on 2018/7/16.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MyView *myView;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

- (IBAction)porgressChanged:(UISlider *)sender;

@end

