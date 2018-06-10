//
//  CatalogProductView.m
//  P63
//
//  Created by Alan Lu on 13/11/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "CatalogProductView.h"

@implementation CatalogProductView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.opaque=YES;
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

-(void)setProduct:(Product *)inputProduct{
    if(self.theProduct!=inputProduct){
        self.theProduct=inputProduct;
    }
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    [_theProduct.name drawAtPoint:CGPointMake(45, 0) forWidth:120 withFont:[UIFont systemFontOfSize:18] minFontSize:12 actualFontSize:NULL lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
    [[UIColor darkGrayColor] set];
    [_theProduct.manufacturer drawAtPoint:<#(CGPoint)#> forWidth:<#(CGFloat)#> withFont:<#(UIFont *)#> minFontSize:<#(CGFloat)#> actualFontSize:<#(CGFloat *)#> lineBreakMode:<#(NSLineBreakMode)#> baselineAdjustment:<#(UIBaselineAdjustment)#>];
}

@end
