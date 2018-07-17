//
//  ViewController.h
//  CityPick
//
//  Created by Salu on 2018/7/7.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Province.h"
@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (nonatomic, strong) Province *selProvince;//该属性用来保存每次刷新后新选中的省

@end

