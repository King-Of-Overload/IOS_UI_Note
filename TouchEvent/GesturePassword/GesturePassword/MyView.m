//
//  MyView.m
//  GesturePassword
//
//  Created by Alan Croft on 2018/7/19.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"

#define ButtonCount 9

@interface MyView ()

@property (nonatomic,strong) NSMutableArray *btns;

@property (nonatomic, strong) NSMutableArray *lineBtns;//所有需要连线的按钮

@property (nonatomic, assign) CGPoint currentPoint;//当前手指的位置

@end

@implementation MyView

-(NSMutableArray *) btns{
    if(_btns == nil){
        _btns = [NSMutableArray array];
        
        for(int i = 0; i < ButtonCount; ++i){
            UIButton *btn = [UIButton new];
            //设置btn的tag
            [btn setTag:i];
            //设置默认的图片
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
            //设置btn错误状态的图片
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_error"] forState:UIControlStateDisabled];
            [btn setUserInteractionEnabled:NO];//禁用交互
            [self addSubview:btn];
            [self.btns addObject:btn];
        }
    }
    return _btns;
}

- (NSMutableArray *) lineBtns{
    if(_lineBtns == nil){
        _lineBtns = [NSMutableArray array];
    }
    return _lineBtns;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //触摸到时启用交互
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView: self];
    
    for(int i = 0; i < self.btns.count; i++){
        UIButton *btn = self.btns[i];
        //用来判断某个点是否在某个frame的范围之内
        if(CGRectContainsPoint(btn.frame, p)){
            // light up btn
            [btn setSelected:YES];
            //添加到划线数组中
            [self.lineBtns addObject:btn];
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    self.currentPoint = p;//当前手指位置赋值
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *btn = self.btns[i];
        if(CGRectContainsPoint(btn.frame, p)){
            //让按钮亮
            [btn setSelected:YES];
            //判断，如果数组中已经有选中的按钮，不要再添加
            if(! [self.lineBtns containsObject:btn]){
                [self.lineBtns addObject:btn];
            }
        }
    }
    //重绘
    [self setNeedsDisplay];
}

//手指离开这个view的时候调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //禁用view交互
    [self setUserInteractionEnabled:NO];
    //修改最后手指的位置连线是最后一个按钮的中心，解决线的问题
    self.currentPoint = [[self.lineBtns lastObject] center];
    //重绘
    [self setNeedsDisplay];
    for (int i = 0; i < self.lineBtns.count; i++) {
        UIButton *btn = self.lineBtns[i];
        //修改为不可用状态,需要同时取消选中状态
        [btn setEnabled:NO];
        [btn setSelected:NO];
    }
    //拼接密码
    NSString *password = @"";
    for (int i = 0; i < self.lineBtns.count; i++) {
        UIButton *btn = self.lineBtns[i];
        password = [password stringByAppendingString:[NSString stringWithFormat:@"%ld",btn.tag]];
    }
    NSLog(@"%@", password);
    //生成密码后调用block给控制器
    if(self.passwordBlock){
        BOOL result = self.passwordBlock(password);
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self clear];
        [self setUserInteractionEnabled:YES];//重新开启用户交互
    });
}

//xib加载时调用
- (void)awakeFromNib{
    [super awakeFromNib];
}

//计算九宫格
- (void) layoutSubviews{
    [super layoutSubviews];
    CGFloat w = 74;//素材宽度
    CGFloat h = w;
    int colCount = 3;//列数
    CGFloat margin = (self.frame.size.width - 3*w) / 4;//间距
    for(int i = 0; i < self.btns.count; i++){
        CGFloat x = (i % colCount) * (margin + w) + margin;
        CGFloat y = (i / colCount) * (margin + w) +margin;
        [self.btns[i] setFrame:CGRectMake(x, y, w, h)];
    }
}

//恢复到最初始的状态
- (void) clear{
    for (int i = 0; i < self.btns.count; i++) {
        UIButton *btn = self.btns[i];
        //取消高亮效果
        [btn setSelected:NO];
        [btn setEnabled:YES];
        //清空所有的线
        [self.lineBtns removeAllObjects];
        //重绘
        [self setNeedsDisplay];
    }
}

//连线
- (void)drawRect:(CGRect)rect {
    
    if(self.lineBtns.count == 0){
        return;
    }
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.lineBtns.count; i++) {
        UIButton *btn = self.lineBtns[i];
        if(i == 0){
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
    }
    //连线到手指的位置
    [path addLineToPoint:self.currentPoint];
    [[UIColor whiteColor] set];
    [path setLineWidth:10.0];
    //设置连接处的样式
    [path setLineJoinStyle:kCGLineJoinRound];
    //头尾
    [path setLineCapStyle:kCGLineCapRound];
    [path stroke];
}


@end
