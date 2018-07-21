//
//  ViewController.m
//  AngryCube
//
//  Created by Alan Croft on 2018/7/21.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic,strong) UIGravityBehavior *gravity;

@property (nonatomic, weak) UIView *pig;
@end

@implementation ViewController

//算比例的结构体
struct MyValue{
    CGFloat startValue;
    CGFloat endValue;
};
typedef struct MyValue myValue;
static inline myValue
myValueMake(CGFloat startValue, CGFloat endValue){
    myValue value;
    value.startValue = startValue;
    value.endValue = endValue;
    return value;
}

- (CGFloat) resultWithConsult:(CGFloat) consule andResultValue:(myValue) resultValue andConsultValue:(myValue) consultValue{
    // y = kx+b   a * r.start + b = c.start
    CGFloat a = (resultValue.startValue - resultValue.endValue) / (consultValue.startValue - consultValue.endValue);
    CGFloat b = (resultValue.startValue) - (a * consultValue.startValue);
    return a * consule + b;
}

-(UIDynamicAnimator *) animator{
    if(_animator == nil){
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加小方块
    UIView *bird = [UIView new];
    [bird setFrame:CGRectMake(150, 300, 30, 30)];
    [bird setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:bird];
    //添加拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [bird addGestureRecognizer:pan];
    
    //添加被打的方块
    UIView *pig = [UIView new];
    [pig setFrame:CGRectMake(500, 300, 30, 30)];
    [pig setBackgroundColor:[UIColor greenColor]];
    self.pig = pig;
    [self.view addSubview:pig];
    //碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[bird, pig]];
    [collision setTranslatesReferenceBoundsIntoBoundary:YES];
    [collision setCollisionDelegate:self];
    [self.animator addBehavior:collision];
}

- (void) collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p{
    NSLog(@"66666");
    //重力
    [_gravity addItem:self.pig];
    
}

-(void) pan:(UIPanGestureRecognizer *) sender{
    //获取移动的偏移量
    CGPoint offset = [sender translationInView:sender.view];
    
    CGPoint currentPoint = [sender locationInView:self.view];
    //计算最后的偏移量
    CGFloat offsetX = sender.view.center.x - currentPoint.x;
    CGFloat offsetY = sender.view.center.y - currentPoint.y;
    //计算拖动的距离
    CGFloat distance = sqrt(offsetX * offsetX + offsetY * offsetY);
    //绘制一个范围
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, sender.view.center.x, sender.view.center.y, 100, 0, 2 * M_PI, YES);
    if(CGPathContainsPoint(path, NULL, currentPoint, NO)){//路径是否包含某点
        //是否放手
        if(sender.state == UIGestureRecognizerStateEnded){
            //添加重力与推力
            UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[sender.view]];
            self.gravity = gravity;
            [self.animator addBehavior:gravity];
            UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[sender.view] mode:UIPushBehaviorModeInstantaneous];
            //设置方向
            [push setPushDirection:CGVectorMake(offsetX, offsetY)];
            [push setMagnitude:[self resultWithConsult:distance andResultValue:myValueMake(0, 1) andConsultValue:myValueMake(0, 100)]];//推量
            [_animator addBehavior:push];
            
        }
    }else{
        return;
    }
    
    //改变view的transform
    [sender.view setTransform:CGAffineTransformTranslate(sender.view.transform, offset.x, offset.y)];
    //归0
    [sender setTranslation:CGPointZero inView:sender.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
