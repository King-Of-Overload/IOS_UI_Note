//
//  NSString+Hash.m
//  SimulateLogin
//
//  Created by Alan Croft on 2018/7/29.
//  Copyright © 2018年 zjut. All rights reserved.
//

#import "NSString+Hash.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Hash)
-(NSString *) md5String{
    const char *str = self.UTF8String;
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];//长度16
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

/**
 返回二进制字节流的字符串的表示形式
 */
- (NSString *) stringFromBytes: (uint8_t *)bytes length:(int) length{
    NSMutableString *strM = [NSMutableString string];
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x",bytes[i]];
    }
    return [strM copy];
}
@end
