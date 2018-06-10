//
//  ViewController.h
//  ScrollView_ContentOffset
//
//  Created by Taylor on 31/5/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

- (IBAction)scroll:(id)sender;
@end

