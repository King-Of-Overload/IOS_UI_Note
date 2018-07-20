//
//  ViewController.h
//  PaintBoard
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyView;
@interface ViewController : UIViewController

- (IBAction)lineWidthChagned:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet MyView *myView;
@property (weak, nonatomic) IBOutlet UISlider *lineWidthProgress;

- (IBAction)lineColorChange:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

- (IBAction)save:(UIBarButtonItem *)sender;
- (IBAction)clear:(UIBarButtonItem *)sender;
- (IBAction)back:(UIBarButtonItem *)sender;
- (IBAction)eraser:(UIBarButtonItem *)sender;
@end

