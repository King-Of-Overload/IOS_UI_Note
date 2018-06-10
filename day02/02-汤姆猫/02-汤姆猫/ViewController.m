//
//  ViewController.m
//  02-汤姆猫
//
//  Created by Alan Lu on 30/9/2016.
//  Copyright (c) 2016年 Zjut. All rights reserved.
//序列帧动画

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
- (IBAction)drink;
@property (weak, nonatomic) IBOutlet UIImageView *tom;

@property(nonatomic,strong)AVAudioPlayer *play;
- (IBAction)sleep;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drink {
    [self runAnimationWithName:@"cat_drink" andWithCount:81];
    [self performSelector:@selector(playSound:) withObject:@"p_drink_milk" afterDelay:1.0];
}
- (IBAction)sleep {
    [self runAnimationWithName:@"cat_knockout" andWithCount:81];
    [self performSelector:@selector(playSound:) withObject:@"angry" afterDelay:1.0];
    //[NSThread cancelPreviousPerformRequestsWithTarget:<#(id)#> selector:<#(SEL)#> object:<#(id)#>];//取消某个方法执行
}

-(void)runAnimationWithName:(NSString *)foldername andWithCount:(int)count{
    //判断是否在执行动画
    if([self.tom isAnimating]){
        return;
    }
    //获取图片 02d的2表示占位符，不足左边补零
    NSMutableArray *images=[NSMutableArray array];
    for (int i=0; i<count; i++) {
        NSString *name=[NSString stringWithFormat:@"%@%04d.jpg",foldername,i];
        //imageNamed:加载完图片后，图片不会释放，图片会驻留内存
        //UIImage *headImage=[UIImage imageNamed:name];
        NSString *imagePath=[[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *headImage=[UIImage imageWithContentsOfFile:imagePath];
        [images addObject:headImage];
    }
    //告诉tom要播放那些图片
    self.tom.animationImages=images;
    //开始播放
    [self.tom setAnimationRepeatCount:1];//播放次数
    [self.tom setAnimationDuration:images.count*0.05];//播放时间
    [self.tom startAnimating];
    //当动画执行完毕后清空,在一定时间以后执行某方法
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:images.count*0.05];
}

-(void) playSound:(NSString*)fileName{
    //获取音效资源的路径
    NSString *path=[[NSBundle mainBundle] pathForResource:fileName ofType:@"m4a"];
    //新建播放器,转换path为url
    NSURL *url=[NSURL fileURLWithPath:path];
    NSError *error;
    AVAudioPlayer *play=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    //播放
    self.play=play;//需要强指针引用
    [self.play play];
}
@end
