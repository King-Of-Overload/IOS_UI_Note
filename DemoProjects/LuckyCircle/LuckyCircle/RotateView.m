//
//  RotateView.m
//  LuckyCircle
//
//  Created by Alan Croft on 2018/7/23.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "RotateView.h"
@interface RotateView ()
@property (nonatomic, weak) UIButton *currentBtn;

@property (nonatomic, strong) CADisplayLink *link;
@end
@implementation RotateView

+ (instancetype) rotateView{
    return [[NSBundle mainBundle] loadNibNamed:@"RotateView" owner:nil options:nil][0];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    for (int i = 0; i < self.rotateOptionView.subviews.count; i++) {
        UIButton *btn = self.rotateOptionView.subviews[i];
        [btn setFrame:CGRectMake(0, 0, 68, 143)];
        [btn setCenter:self.rotateOptionView.center];
        //设置锚点
        [btn.layer setAnchorPoint:CGPointMake(0.5, 1)]; //0 -- 1
        //btn分散，设置transform
        CGFloat angle = 2 * M_PI / self.rotateOptionView.subviews.count;//夹角
        [btn setTransform:CGAffineTransformMakeRotation(angle * i)];
    }
}
//创建十二宫按钮
- (void)awakeFromNib{
    [super awakeFromNib];
    for (int i = 0; i < 12; i++) {
        UIButton *btn = [UIButton new];
        //设置btn的tag
        [btn setTag:i];
        //设置图片
        UIImage *image = [UIImage imageNamed:@"LuckyAstrology"];
        UIImage *imagePressed = [UIImage imageNamed:@"LuckyAstrologyPressed"];
        image = [self clipImageWithImage:image withIndex:i];
        imagePressed = [self clipImageWithImage:imagePressed withIndex:i];
        [btn setImage:image forState:UIControlStateNormal];
        [btn setImage:imagePressed forState:UIControlStateSelected];
        //设置选中背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        //btn内部的imageView往上偏移,设置内边距
        [btn setImageEdgeInsets:UIEdgeInsetsMake(- 50, 0, 0, 0)];
        [self.rotateOptionView addSubview:btn];
        //监听按钮
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

//按钮点击事件
- (void) btnClick:(UIButton *) sender{
    //把记录的按钮的选中状态取消
    [self.currentBtn setSelected:NO];
    [sender setSelected:YES];
    //记录选中的btn
    self.currentBtn = sender;
}

//开始旋转
- (void) startRotate{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
    self.link = link;
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

//开始选号
- (IBAction)pickNumber:(UIButton *)sender {
    if([self.rotateOptionView.layer animationForKey:@"key"]){
        return;
    }
    //停止旋转
    [self.link setPaused:YES];
    //使用核心动画
    CABasicAnimation *animation = [CABasicAnimation new];
    [animation setKeyPath:@"transform.rotation"];
    //计算减去的夹角
    CGFloat angle = 2 * M_PI / 12 * self.currentBtn.tag;
    [animation setToValue:@(5 * M_PI * 2 - angle)];//转5圈
    [animation setDuration: 3];
    //设置不回到原处
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    [self.rotateOptionView.layer addAnimation:animation forKey:@"key"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animation.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //将view旋转到初始位置
        [self.rotateOptionView setTransform:CGAffineTransformMakeRotation(-angle)];
        //弹框
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"你中了macbook pro" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView setDelegate:self];
        [alertView show];
        //移除核心动画
        [self.rotateOptionView.layer removeAnimationForKey:@"key"];
    });
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.link setPaused:NO];
}
//旋转操作
- (void) rotate{
    //时钟60HZ
    [self.rotateOptionView setTransform:CGAffineTransformRotate(self.rotateOptionView.transform, 2 * M_PI / 60 / 10)];//10秒一圈
}

//切割十二宫图片
-(UIImage *) clipImageWithImage: (UIImage *) image withIndex:(NSInteger) index{
    //计算rect
    CGFloat w = image.size.width / 12 * [UIScreen mainScreen].scale;
    CGFloat h = image.size.height * [UIScreen mainScreen].scale;
    CGFloat x = index * w;
    CGFloat y = 0;
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, w, h));
    return [[UIImage alloc] initWithCGImage:imageRef scale:2.3 orientation:UIImageOrientationUp];
    
}



@end
