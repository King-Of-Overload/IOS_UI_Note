//
//  ViewController.h
//  tableview_flower
//
//  Created by Taylor on 1/6/18.
//  Copyright © 2018年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

