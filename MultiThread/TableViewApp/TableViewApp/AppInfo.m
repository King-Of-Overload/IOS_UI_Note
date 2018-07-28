//
//  AppInfo.m
//  TableViewApp
//
//  Created by Alan Croft on 2018/7/26.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary: dict];
    }
    return self;
}

+ (instancetype)appInfoWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)appInfos{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Apps.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrayModels = [NSMutableArray arrayWithCapacity:array.count];
    for (int i = 0; i < array.count; i++) {
        AppInfo *model = [AppInfo appInfoWithDict:array[i]];
        [arrayModels addObject:model];
    }
    return arrayModels.copy;
}
@end
