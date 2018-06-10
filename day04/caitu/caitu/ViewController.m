//
//  ViewController.m
//  caitu
//
//  Created by Alan Lu on 25/10/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController ()
- (IBAction)next;
@property(nonatomic,assign)int index;//索引值
//记录数据
@property(nonatomic,strong)NSArray *questions;

@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIButton *headView;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *beBiggerBtn;//放大按钮

@property(nonatomic,weak)UIButton *cover;//遮罩层阴影
- (IBAction)big;

- (IBAction)headClick;
@property (weak, nonatomic) IBOutlet UIView *optionView;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIButton *scoreBtn;
- (IBAction)tipClick;
@end

@implementation ViewController
/*
 懒加载
 */
-(NSArray *)questions{
    if(_questions==nil){
        //获取plist文件的路径
        NSString *path=[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        //读取plist文件
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        //字典转模型
        NSMutableArray *tempArray=[NSMutableArray array];
        for(NSDictionary *dict in dictArray){
            Question *question=[Question questionWithDict:dict];
            [tempArray addObject:question];
        }
        _questions=tempArray;
    }
    return _questions;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.index=-1;
    [self next];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/***
 下一题
 */
- (IBAction)next {
    if(_index==self.questions.count-1){
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"你通关了" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"知道了",@"拜拜", nil];
        [alert show];
        return;
    }
    //索引值+1
    self.index++;
    //设置数据
    Question *question=[self.questions objectAtIndex:_index];
    [self.numLabel setText:[NSString stringWithFormat:@"%d/%d",self.index+1,self.questions.count]];
    [_descLabel setText:question.title];
    [_headView setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    self.nextBtn.enabled=(self.index!=self.questions.count-1);
    
    //添加之前移除
    for(UIButton *answerBtn in self.answerView.subviews){
        [answerBtn removeFromSuperview];
    }
    //添加答案按钮
    NSInteger answerLength= question.answer.length;
    
    CGFloat answerBtnW=38;
    CGFloat answerBtnH=answerBtnW;
    CGFloat answerBtnY=0;
    CGFloat answerSpaceXMargin=10;
    CGFloat answerLeftMargin=(self.view.frame.size.width-answerBtnW*answerLength-answerSpaceXMargin*(answerLength-1))*0.5;
    for(int i=0;i<answerLength;i++){
        UIButton *answerBtn=[UIButton new];
        //设置frame
        CGFloat answerBtnX=answerLeftMargin+(answerBtnW+answerSpaceXMargin)*i;
        answerBtn.frame=CGRectMake(answerBtnX, answerBtnY, answerBtnW, answerBtnH);
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [_answerView addSubview:answerBtn];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //添加点击事件
        [answerBtn addTarget:self action:@selector(answerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    //清除待选项按钮
    for(UIButton *optionBtn in _optionView.subviews){
        [optionBtn removeFromSuperview];
    }
    //添加待选项按钮
    NSInteger optionLength=question.options.count;
    CGFloat optionW=38;
    CGFloat optionH=optionW;
    int totalColumn=7;//总列数
    CGFloat optionSpaceX=6;
    CGFloat optionSpaceY=6;
    CGFloat optionTopMargin=8;
    CGFloat optionLeftMargin=(self.view.frame.size.width-totalColumn*optionW-(totalColumn-1)*optionSpaceX)*0.5;
    for(int i=0;i<optionLength;i++){
        //创建一个按钮
        UIButton *optionBtn=[UIButton new];
        //设置frame
        int col=i%totalColumn;
        int row=i/totalColumn;
        CGFloat optionBtnX=optionLeftMargin+(optionW+optionSpaceX)*col;
        CGFloat optionBtnY=optionTopMargin+(optionH+optionSpaceY)*row;
        optionBtn.frame=CGRectMake(optionBtnX, optionBtnY, optionW, optionH);
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        [self.optionView addSubview:optionBtn];
        //设置文字
        [optionBtn setTitle:question.options[i] forState:UIControlStateNormal];
        //更改颜色
        [optionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //监听按钮点击
        [optionBtn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}


/**
 *答案按钮点击事件
 */
-(void)answerBtnClick:(UIButton*)answerBtn{
    
    //让和点击的答案按钮文字相同的option项按钮取消隐藏
    for(UIButton *optionBtn in _optionView.subviews){
        NSString *optionTitle=[optionBtn titleForState:UIControlStateNormal];
        if([optionTitle isEqualToString:[answerBtn titleForState:UIControlStateNormal]]){
            [optionBtn setHidden:NO];//显示隐藏的按钮
            break;
        }
    }
    //让点击的答案按钮文字消失
    [answerBtn setTitle:nil forState:UIControlStateNormal];
}

/**
 *监听选项按钮点击
 */
-(void)optionClick:(UIButton*)optionBtn{
    NSString *optionTitle=[optionBtn titleForState:UIControlStateNormal];
    //让点击的按钮隐藏
    optionBtn.hidden=YES;
    //把点击待选项按钮的文字显示到第一个没有文字的按钮中
    for(UIButton *answerBtn in _answerView.subviews){
        NSString *answerTitle=[answerBtn titleForState:UIControlStateNormal];
        if(answerTitle==nil){
            [answerBtn setTitle:optionTitle forState:UIControlStateNormal];
            break;
        }
    }
    //判断答案框是否满了
    BOOL full=YES;
    NSMutableString *tempString=[NSMutableString string];
    for(UIButton *answerBtn in self.answerView.subviews){
        NSString *answerTitle=[answerBtn titleForState:UIControlStateNormal];
        if(answerTitle.length==0){
            full=NO;
            break;
        }
        [tempString appendString:answerTitle];
    }
    
    Question *question=_questions[_index];
    NSString *answer=question.answer;
    if(full){//判断答案是否正确
        if([tempString isEqualToString:answer]){
            NSLog(@"はい");
            int score=[[_scoreBtn titleForState:UIControlStateNormal]intValue];
            score+=100;
            [_scoreBtn setTitle:[NSString stringWithFormat:@"%d",score] forState:UIControlStateNormal];
            for(UIButton *answerBtn in _answerView.subviews){
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            //一段时间以后跳转到下一题
            [self performSelector:@selector(next) withObject:nil afterDelay:0.5];
        }else{
            NSLog(@"いいえ");
            for(UIButton *answerBtn in _answerView.subviews){
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
        }
    }
}

/**
 *点击按钮变大
 */
- (IBAction)big {
    //1、添加阴影
    UIButton *cover=[[UIButton alloc] initWithFrame:self.view.bounds];
    [cover setBackgroundColor:[UIColor blackColor]];
    [cover setAlpha:0.0];
    _cover=cover;
    [self.view addSubview:cover];
    //为遮罩层添加点击事件
    [cover addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside];
    //2、调整位置
    [self.view bringSubviewToFront:self.headView];
    [UIView setAnimationDuration:1.5];
    cover.alpha=0.6;
    //3、修改头像frame
    [UIView beginAnimations:nil context:nil];
    CGFloat headViewW=self.view.frame.size.width;
    CGFloat headViewH=headViewW;
    CGFloat headViewX=0;
    CGFloat headViewY=(self.view.frame.size.height-headViewH)*0.5;
    self.headView.frame=CGRectMake(headViewX, headViewY, headViewW, headViewH);
    [UIView commitAnimations];
}

- (IBAction)headClick {
    if(self.cover==nil){
        [self big];
    }else{
        [self smallImage];
    }
}

/**
 *点击遮罩层使图片变小
 */
-(void)smallImage{
    [UIView animateWithDuration:0.5 animations:^{
        //修改头像的frame,变小
        self.headView.frame=CGRectMake(95, 106, 130, 140);
        [_cover setAlpha:0.0];
    } completion:^(BOOL finished) {
        if(finished){
            //让阴影消失
            [_cover removeFromSuperview];
            //self.cover=nil;
        }
    }];
}

/**
 *提示功能
 */
- (IBAction)tipClick {
    
}
@end
