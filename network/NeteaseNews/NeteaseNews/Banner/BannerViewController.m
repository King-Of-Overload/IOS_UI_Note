//
//  BannerViewController.m
//  NeteaseNews
//
//  Created by Alan Croft on 2018/7/30.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "BannerViewController.h"
#import "Headline.h"
#import "HeadlineCell.h"

@interface BannerViewController ()
@property (nonatomic, strong) NSArray *headLines;

//当前图片的索引
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation BannerViewController
//必须设置flowLayout
//必须注册cell(从故事版中加载， 注册自定义cell 注册xib)
- (void)setHeadLines:(NSArray *)headLines{
    _headLines = headLines;
    //重新加载刷新collectionview
    [self.collectionView reloadData];
    //始终显示第二个cell
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:0 animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Headline headLinesWithSuccess:^(NSArray *array) {
        self.headLines = array;
    } error:^{
        NSLog(@"error");
    }];
    //设置flowlayout
    [self setCollectionViewStyle];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //等待collectionview大小设置完后， 再设置cell大小
    [self.flowLayout setItemSize:self.collectionView.frame.size];
}
//设置collectionview样式
-(void) setCollectionViewStyle{
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //取消间隔
    [self.flowLayout setMinimumLineSpacing:0.0];
    //分页
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];//关闭指示器
    [self.collectionView setBounces:NO];//关闭弹性效果
}

//数据源方法
//返回多少项
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.headLines count];
}
//每一项
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HeadlineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headline" forIndexPath:indexPath];
    //滚动过程中下一张要显示图片的索引
    NSInteger index = (self.currentIndex + indexPath.item - 1 + self.headLines.count) % self.headLines.count;
    [cell setTag: index];
    [cell setHeadline:self.headLines[index]];
    return cell;
}

//collectionview滚动停止之后更换cell
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //计算下一张图片的索引
    // 0   2   偏移cell个数
    int offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    self.currentIndex = (self.currentIndex + offset + self.headLines.count) % self.headLines.count;
    NSLog(@"%zd", self.currentIndex);
    //将cell换成第二个cell
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:0 animated:NO];
    });
}
@end
