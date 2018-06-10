//
//  Product.h
//  p33
//
//  Created by zjc on 16/9/25.
//  Copyright © 2016年 zjc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property int ID;
@property  NSString *name;
@property NSString *manufacturer;
@property NSString *details;
@property float price;
@property int quantity;
@property NSString *countryOfOrigin;
@property NSString *image;

@end
