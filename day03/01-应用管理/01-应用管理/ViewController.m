//
//  ViewController.m
//  01-应用管理
//
//  Created by Alan Lu on 1/10/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "GoodAppModel.h"
#import "AppView.h"
@interface ViewController ()
//用来存放数据
@property(nonatomic,strong)NSArray *apps;
@end

@implementation ViewController

-(NSArray *)apps{
    if(_apps==nil){
        //获取全路径
        NSString *path=[[NSBundle mainBundle] pathForResource:@"icons.plist" ofType:nil];
        //读取plist文件
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        //字典转模型
        NSMutableArray *tempArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            AppModel *appModel=[AppModel appModelWithDict:dict];
            [tempArray addObject:appModel];
            //GoodAppModel *goodApp=[GoodAppModel appModelWithDict:dict];
        }
        _apps=tempArray;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat appViewWidth=80;
    CGFloat appViewHeight=110;
    CGFloat spaceXmargin=15;//每个图标的间距
    CGFloat topmargin=30;
    CGFloat spaceymargin=25;
    CGFloat leftXmargin=(self.view.frame.size.width-3*appViewWidth-2*spaceXmargin)*0.5;
    //九宫格算法
    for(int i=0;i<self.apps.count;i++){
        //添加格子
        //UIView *appView=[UIView new];
        //加载xib
        AppView *appView=[AppView loadView];
        int col=i%3;
        int row=i/3;
        CGFloat appViewX=leftXmargin+(appViewWidth+spaceXmargin)*col;
        CGFloat appViewY=topmargin+(spaceymargin+appViewHeight)*row;
        //设置位置
        [appView setFrame:CGRectMake(appViewX, appViewY, appViewWidth, appViewHeight)];
        //添加
        [self.view addSubview:appView];
        AppModel *appViewModel=self.apps[i];
        appView.appModel=appViewModel;
        //获取子控件并赋值
//        UIImageView *headView= (UIImageView *)appView.subviews[0];
//        [headView setImage:[UIImage imageNamed:appModel.icon]];
//        UILabel *nameLabel=appView.subviews[1];
//        nameLabel.text=appModel.name;
        
        
        
        
//        //取出数据
//        AppModel *appModel=self.apps[i];
//        //添加图片
//        UIImageView *headView=[UIImageView new];
//        CGFloat headViewWidth=55;
//        CGFloat headViewX=(appViewWidth-headViewWidth)*0.5;
//        CGFloat headViewY=0;
//        CGFloat headViewHeight=50;
//        [headView setFrame:CGRectMake(headViewX, headViewY, headViewWidth, headViewHeight)];//确定位置
//        [appView addSubview:headView];
//        [headView setImage:[UIImage imageNamed:appModel.icon]];
//        //添加名称
//        UILabel *nameLabel=[UILabel new];
//        CGFloat nameLabelX=0;
//        CGFloat nameLabelY=headViewY+headViewHeight;
//        CGFloat nameLabelWidth=appViewWidth;
//        CGFloat nameLabelHeigth=20;
//        [nameLabel setFrame:CGRectMake(nameLabelX, nameLabelY, nameLabelWidth, nameLabelHeigth)];
//        [appView addSubview:nameLabel];
//        [nameLabel setTextAlignment:NSTextAlignmentCenter];
//        [nameLabel setText:appModel.name];
//        [nameLabel setFont:[UIFont systemFontOfSize:14]];
//        //添加按钮
//        UIButton *downLoadBtn=[UIButton new];
//        CGFloat downloadBtnX=10;
//        CGFloat spaceMargin=5;
//        CGFloat downloadBtnWidth=appViewWidth-2*downloadBtnX;
//        CGFloat downloadBtnY=nameLabelY+nameLabelHeigth+spaceMargin;
//        CGFloat downloadBtnHeight=20;
//        [downLoadBtn setFrame:CGRectMake(downloadBtnX, downloadBtnY, downloadBtnWidth, downloadBtnHeight)];
//        [appView addSubview:downLoadBtn];
//        [downLoadBtn setBackgroundColor:[UIColor greenColor]];
//        [downLoadBtn setTitle:@"下载" forState:UIControlStateNormal];
        
    }
}


@end
