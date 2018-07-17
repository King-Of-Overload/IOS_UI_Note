//
//  ViewController.m
//  KuniFlag
//
//  Created by Salu on 2018/7/8.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "Flag.h"
#import "FlagView.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *flags;

@end

@implementation ViewController
//懒加载
-(NSArray *) flags{
    if(_flags == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for(int i = 0; i < dictArray.count; i++){
            Flag *flag = [Flag flagWithDict:dictArray[i]];
            [arrayModels addObject:flag];
        }
        _flags = [arrayModels copy];
    }
    return _flags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
}
//多少组
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//每组多少行
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}

//显示内容
-(UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //创建view
    FlagView *flagView = [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
    flagView.flag = self.flags[row];
    return flagView;
}

-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 83;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
