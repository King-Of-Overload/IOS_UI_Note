//
//  ViewController.h
//  ScrollView_indictor
//
//  Created by Taylor on 31/5/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) NSTimer *timer;
@end

