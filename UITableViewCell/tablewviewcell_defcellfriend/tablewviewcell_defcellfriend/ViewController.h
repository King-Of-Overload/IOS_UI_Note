//
//  ViewController.h
//  tablewviewcell_defcellfriend
//
//  Created by Taylor on 2/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FooterView.h"

@interface ViewController : UIViewController <UITableViewDataSource,FooterViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

