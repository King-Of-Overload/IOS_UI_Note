//
//  MasterViewController.h
//  p33
//
//  Created by zjc on 16/9/26.
//  Copyright © 2016年 zjc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "product.h"
#import "DBAccess.h"
#import "DetailViewController.h"
@interface MasterViewController : UITableViewController
@property NSMutableArray* products;
@property DetailViewController* detailViewController;
@end
