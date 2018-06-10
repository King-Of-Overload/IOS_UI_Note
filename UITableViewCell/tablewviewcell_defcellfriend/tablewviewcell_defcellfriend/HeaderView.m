//
//  HeadlerView.m
//  tablewviewcell_defcellfriend
//
//  Created by Salu on 2018/6/9.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView()


@end

@implementation HeaderView


+(instancetype)headerView{
    HeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] firstObject];
    return headerView;
}

//加载xib完毕后会被系统调用
-(void)awakeFromNib{
    //加载轮播图
    //self.scrollView.contentSize =
}

@end
