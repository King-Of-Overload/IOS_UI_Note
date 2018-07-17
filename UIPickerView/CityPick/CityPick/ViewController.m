//
//  ViewController.m
//  CityPick
//
//  Created by Salu on 2018/7/7.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"
@interface ViewController ()
@property(nonatomic, strong) NSArray *provinces;
@end

@implementation ViewController

//懒加载
-(NSArray *) provinces{
    if(_provinces == nil){
        //字典转模型
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
        NSMutableArray *arrayModel = [NSMutableArray array];
        //转换为模型
        for(int i = 0; i < arrayDict.count; i++){
            Province *model = [Province proviceWithDict:arrayDict[i]];
            [arrayModel addObject:model];
        }
        _provinces = arrayModel;
    }
    return _provinces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pickerView setDataSource:self];
    [self.pickerView setDelegate:self];
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
}


-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0){
        return [self.provinces count];
    }else{
        NSInteger selectedProvinceIndex = [pickerView selectedRowInComponent:0];
        self.selProvince = self.provinces[selectedProvinceIndex];//保存选中的省
        return [[self.selProvince cities] count];
    }
}

//刷新
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        //刷新城市
        [pickerView reloadComponent:1];
        //去选中第一组第0行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    //显示文字内容
    NSInteger selectedProvinceIndex = [pickerView selectedRowInComponent:0];
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    [self.provinceLabel setText:[self.provinces[selectedProvinceIndex] name]];
    [self.cityLabel setText:[self.selProvince cities][cityIndex]];//更改此处
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0){
        return [self.provinces[row] name];
    }else{
//        NSInteger selectedProvinceIndex = [pickerView selectedRowInComponent:0];
//        return [self.provinces[selectedProvinceIndex] cities][row];
        return [self.selProvince cities][row];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
