//
//  ViewController.m
//  OrderFood
//
//  Created by Salu on 2018/7/7.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *foods;
@end

@implementation ViewController

-(NSArray *) foods{
    if(_foods == nil){
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil]];
    }
    return _foods;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pickerView setDelegate:self];
    [self.pickerView setDataSource:self];
    //默认选中
    for(int i = 0; i < self.foods.count; i++){
        [self pickerView:self.pickerView didSelectRow:0 inComponent:i];
    }
}

//随机点餐按钮点击事件
- (IBAction)randomFoodClick:(id)sender {
    //遍历集合中的所有组
    for(int i = 0;i < self.foods.count; ++i){
        //第i组里面的所有数据
        NSUInteger count = [self.foods[i] count];
        //获取第i组当前选中的行
        NSInteger currentRow = [self.pickerView selectedRowInComponent:i];
        //生成随机数
        u_int32_t ranNum = arc4random_uniform((int)count);
        while(currentRow == ranNum){
            ranNum = arc4random_uniform((int)count);
        }
        //更改UI
        [self.pickerView selectRow:ranNum inComponent:i animated:YES];
        //label显示
        [self pickerView:self.pickerView didSelectRow:ranNum inComponent:i];
    }
}

#pragma mark  数据源方法
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.foods.count;
}

//多少组
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.foods[component] count];
}
//每一行的标题
-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *comFoods = self.foods[component];
    return comFoods[row];
}
//选中某一组某一行的数据
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *selFood = self.foods[component][row];
    NSLog(@"%@", selFood);
    switch (component) {
        case 0:
            self.fruitLabel.text = selFood;
            break;
        case 1:
            self.mainFoodLabel.text = selFood;
            break;
        case 2:
            self.drinkLabel.text = selFood;
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
