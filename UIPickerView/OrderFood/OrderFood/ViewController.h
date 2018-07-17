//
//  ViewController.h
//  OrderFood
//
//  Created by Salu on 2018/7/7.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;


@property (weak, nonatomic) IBOutlet UILabel *mainFoodLabel;

@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;

- (IBAction)randomFoodClick:(id)sender;

@end

