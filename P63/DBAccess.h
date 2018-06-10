//
//  DBAccess.h
//  p33
//
//  Created by zjc on 16/9/27.
//  Copyright © 2016年 zjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Product.h"

@interface DBAccess : NSObject

- (NSMutableArray*) getAllProducts;
- (void) closeDatabase;
- (void)initializeDatabase;
@end



