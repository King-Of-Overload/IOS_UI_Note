//
//  MyView.m
//  PaintBoard
//
//  Created by Alan Croft on 2018/7/20.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "MyView.h"
#import "MyBezierPath.h"

@interface MyView()
//@property (nonatomic, strong) MyBezierPath *path;
@property (nonatomic, strong) NSMutableArray *paths;
@end
@implementation MyView

- (NSMutableArray *) paths{
    if(_paths == nil){
        _paths = [NSMutableArray array];
    }
    return _paths;
}

//-(MyBezierPath *) path{
//    if(_path == nil){
//        _path = [MyBezierPath new];
//    }
//    return _path;
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    MyBezierPath *path = [MyBezierPath new];
    [path setLineWidth:self.lineWidth];
    [path setLineColor:self.lineColor];
    [path moveToPoint:p];//起点
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [self.paths.lastObject addLineToPoint:p];
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    for (MyBezierPath *p in _paths) {
        [p setLineCapStyle:kCGLineCapRound];
        [p setLineJoinStyle:kCGLineJoinRound];
        [p.lineColor set];
        [p stroke];
    }
    
}



- (void)clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}

- (void)eraser {
    self.lineColor = self.backgroundColor;
}


@end
