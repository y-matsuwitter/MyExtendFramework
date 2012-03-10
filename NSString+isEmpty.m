//
//  NSString+isEmpty.m
//
//  Created by Sugamiya Yusuke on 12/02/13.
//

// for MD5
#import <CommonCrypto/CommonDigest.h>
#import "NSString+isEmpty.h"

@implementation NSString (NSStringIsEmpty)

- (BOOL)isEmpty
{
    return (self == nil || [self isEqualToString:@""])?YES:NO;
}

- (BOOL)isMatchRegExp:(NSString *)regExpStr
{
    NSError* error = nil;
    NSRegularExpression* regexp;
    regexp = [NSRegularExpression regularExpressionWithPattern:regExpStr
                                                       options:0
                                                         error:&error];
    if (error) {
        MyLog(@"NSRegularExpression error");
        return NO;
    } else {
        NSTextCheckingResult* match;
        match = [regexp firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
        return (match.numberOfRanges>0)?YES:NO;
    }
}

- (NSString *)md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], 
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];  
}

@end
