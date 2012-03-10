//
//  NSArray+makeNullArray.m
//
//  Created by Sugamiya Yusuke on 12/03/01.
//

#import "NSArray+makeNullArray.h"

@implementation NSArray (makeNullArray)

+ (NSArray*)makeNullArrayNumberOfSize:(NSInteger)number
{
    return [NSArray arrayWithArray:[NSMutableArray makeNullArrayNumberOfSize:number]];
}

@end


@implementation NSMutableArray (makeNullArray)

+ (NSMutableArray*)makeNullArrayNumberOfSize:(NSInteger)number
{
    NSMutableArray* aray = [NSMutableArray array];
    NSInteger i;
    for (i=0; i<number; i++) {
        [aray addObject:_null];
    }
    return aray;
}

@end
