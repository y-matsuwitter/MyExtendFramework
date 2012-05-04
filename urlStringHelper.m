//
//  urlStringHelper.m
//  GoogleDocsTesting
//
//  Created by Sugamiya Yusuke on 12/05/04.
//  Copyright (c) 2012年 UNIPRO. All rights reserved.
//

#import "urlStringHelper.h"

@implementation urlStringHelper

+ (NSString*)buldGetParamsStringWithBaseUrlString:(NSString*)baseUrlString
                          requestParamsDictionary:(NSDictionary*)requestParamsDictionary
                                      andEncoding:(NSStringEncoding)encoding
{
    NSMutableString* params = [NSMutableString string];
    for (NSString* key in requestParamsDictionary) {
        id value = [requestParamsDictionary objectForKey:key];
        // NSString だった場合
        if ([value isKindOfClass:[NSString class]]) {
            value = (NSString*)value;
            if (![value isEmpty]) {
                // UTF-8 な感じで。EUC-JP なら NSJapaneseEUCStringEncoding で  SJIS なら NSShiftJISStringEncoding
                NSString* escapedString = [value stringByAddingPercentEscapesUsingEncoding:encoding];
                NSString* finallyEscape = (NSString*)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                             (CFStringRef)escapedString,
                                                                                             NULL,
                                                                                             (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                             CFStringConvertNSStringEncodingToEncoding(encoding));
                [finallyEscape autorelease];
                [params appendFormat:@"%@=%@&", key, finallyEscape];
            }
        }
        // NSNumber だった場合
        else if ([value isKindOfClass:[NSNumber class]]) {
            value = (NSNumber*)value;
            NSString* numberString = [value stringValue];
            [params appendFormat:@"%@=%@&", key, numberString];
        }
    }
    // 尻の & 一文字が余計なので削除
    NSInteger len = [params length];
    [params deleteCharactersInRange:NSMakeRange(len-1,1)];
    
    NSString* fullUrlString = [NSString stringWithFormat:@"%@?%@", baseUrlString, params];
    
    return fullUrlString;
}

@end
