//
//  urlStringHelper.h
//  GoogleDocsTesting
//
//  Created by Sugamiya Yusuke on 12/05/04.
//  Copyright (c) 2012年 UNIPRO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface urlStringHelper : NSObject

+ (NSString*)buldGetParamsStringWithBaseUrlString:(NSString*)baseUrlString
                          requestParamsDictionary:(NSDictionary*)requestParamsDictionary
                                      andEncoding:(NSStringEncoding)encoding;

@end
