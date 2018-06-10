^{
    <#code#>
}//
//  ViewController.m
//  03-图片浏览器
//
//  Created by Alan Lu on 30/9/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "ImageModel.h"

@interface ViewController ()
- (IBAction)previous;
- (IBAction)next;
@property (weak, nonatomic) IBOutlet UILabel *noLabel;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property(nonatomic,assign)int index;

//放置数据,一般oc对象用strong对象
@property(nonatomic,strong)NSArray *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.noLabel.text=@"1/5";
//    self.head.image=[UIImage imageNamed:@"i1"];
//    self.descLabel.text=@"美女1";
//    self.previousBtn.enabled=NO;
    [self changeData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)previous {
    self.index--;
    [self changeData];
}

//懒加载，重写get方法
//核心思想：当数据不存在的时候加载
-(NSArray*) image{
    if(_image==nil){
//        NSMutableDictionary *dict1=[NSMutableDictionary dictionary];
//        dict1[@"icon"]=@"i1";
//        dict1[@"desc"]=@"美女1";
//        NSMutableDictionary *dict2=[NSMutableDictionary dictionary];
//        dict2[@"icon"]=@"i2";
//        dict2[@"desc"]=@"美女2";
//        NSMutableDictionary *dict3=[NSMutableDictionary dictionary];
//        dict3[@"icon"]=@"i3";
//        dict3[@"desc"]=@"美女3";
//        NSMutableDictionary *dict4=[NSMutableDictionary dictionary];
//        dict4[@"icon"]=@"i4";
//        dict4[@"desc"]=@"美女4";
//        NSMutableDictionary *dict5=[NSMutableDictionary dictionary];
//        dict5[@"icon"]=@"i5";
//        dict5[@"desc"]=@"美女5";
//        _image=@[dict1,dict2,dict3,dict4,dict5];
        //获取plist文件的全路径
        NSString *path=[[NSBundle mainBundle] pathForResource:@"images/plist" ofType:nil];
        //读取plist文件
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        //字典转模型
        NSMutableArray *tempArray=[NSMutableArray array];
        for (NSDictionary *dict in dict) {
            ImageModel *imageModel=[ImageModel new];
            imageModel.icon= dict[@"icon"];
            imageModel.desc=dict[@"desc"];
            [tempArray addObject:imageModel];
        }
        _image=tempArray;
    }
    return _image;
}

- (IBAction)next {
    //索引值+1
    self.index++;
    [self changeData];
    }

-(void)changeData{
    self.noLabel.text=[NSString stringWithFormat:@"%d/%ld",self.index+1,self.image.count];
    //根据索引值设置数据
   // NSDictionary *dict=self.image[self.index];
    ImageModel *imgModel=self.image[self.index];
    self.head.image=[UIImage imageNamed:imgModel.icon];
    self.descLabel.text=imgModel.desc;
    //设置按钮的状态
//    if(self.index==4){
//        self.nextBtn.enabled=NO;
//    }else{
//        self.nextBtn.enabled=YES;
//    }
    self.previousBtn.enabled=(self.index!=0);
    self.nextBtn.enabled=(self.index!=4);
    //设置按钮的状态
//    if(self.index==0){
//        self.previousBtn.enabled=NO;
//    }else{
//        self.previousBtn.enabled=YES;
//    }
}
@end
