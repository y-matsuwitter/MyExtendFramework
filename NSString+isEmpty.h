//
//  NSString+isEmpty.h
//
//  Created by Sugamiya Yusuke on 12/02/13.
//

#import <Foundation/Foundation.h>

@interface NSString (NSStringIsEmpty)

- (BOOL)isEmpty;
- (BOOL)isMatchRegExp:(NSString*)regExpStr;
- (NSString *)md5String;

@end
