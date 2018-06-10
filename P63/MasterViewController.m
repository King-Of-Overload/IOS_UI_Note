//
//  MasterViewController.m
//  p33
//
//  Created by zjc on 16/9/26.
//  Copyright © 2016年 zjc. All rights reserved.
//

#import "MasterViewController.h"


@interface MasterViewController ()

@end

@implementation MasterViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Catalog", @"Catalog");
    }
    return self;
}

- (void)getAllProducts
{
    NSMutableArray *products = [[NSMutableArray alloc] init];
    Product  *product1 = [[Product alloc] init];
    product1.ID = 1;
    product1.name =  @"三菱中央空调";
    product1.manufacturer =  @"三菱电机";
    product1.details = @"5联机";
    product1.price = 60000;
    product1.quantity = 5;
    product1.countryOfOrigin =  @"1";
    product1.image =  @"ss";
    
    [products addObject:product1];
    
    Product  *product2 = [[Product alloc] init];
    product2.ID = 2;
    product2.name =  @"格力中央空调";
    product2.manufacturer =  @"珠海格力";
    product2.details = @"5联机";
    product2.price = 30000;
    product2.quantity = 50;
    product2.countryOfOrigin =  @"1";
    product2.image =  @"ss";
    
    [products addObject:product2];

    Product  *product3 = [[Product alloc] init];
    product3.ID = 3;
    product3.name =  @"大金中央空调";
    product3.manufacturer =  @"大金";
    product3.details = @"5联机";
    product3.price = 50000;
    product3.quantity = 8;
    product3.countryOfOrigin =  @"1";
    product3.image =  @"ss";
    
    [products addObject:product3];
    
    self.products = products;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    //  Get the DBAccess object;
    DBAccess *dbAccess = [[DBAccess alloc] init];
    
    //  Get the products array from the database
    self.products = [dbAccess getAllProducts];
    
    //  Close the database because we are finished with it
    [dbAccess closeDatabase];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.products count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier] ;
    }
    Product* product = [self.products objectAtIndex:[indexPath row]];
    cell.textLabel.text = product.name ;
    return cell;
    
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    }
    // 将主表视图控制器类中的Product对象传给细表视图控制器类的detailItem属性
    self.detailViewController.detailItem = [self.products objectAtIndex:indexPath.row];
    // 实现导航跳转
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}





@end
