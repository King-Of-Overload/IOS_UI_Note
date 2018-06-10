//
//  CatalogTableViewCell.h
//  P63
//
//  Created by Alan Lu on 13/11/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "CatalogProductView.h"

@interface CatalogTableViewCell : UITableViewCell

-(void)setProduct:(Product*)theProduct;

@property(nonatomic,strong)CatalogProductView *catalogProductView;

@end
