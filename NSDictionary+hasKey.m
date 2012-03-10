//
//  NSDictionary+hasKey.m
//
//  Created by Sugamiya Yusuke on 12/02/11.
//

#import "NSDictionary+hasKey.h"

@implementation NSDictionary (NSDictionaryHasKey)

- (BOOL)hasKey:(id)key
{
    return ([self objectForKey:key])?YES:NO;
}

@end
