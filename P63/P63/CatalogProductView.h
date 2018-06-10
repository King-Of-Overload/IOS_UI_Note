//
//  CatalogProductView.h
//  P63
//
//  Created by Alan Lu on 13/11/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface CatalogProductView : UIView
    @property(nonatomic,strong) Product *theProduct;


-(void)setProduct:(Product*)inputProduct;
@end
