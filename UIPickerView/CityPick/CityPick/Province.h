//
//  Province.h
//  CityPick
//
//  Created by Salu on 2018/7/7.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray *cities;


-(instancetype) initWithDict: (NSDictionary *) dict;

+(instancetype) proviceWithDict: (NSDictionary *) dict;
@end
