//
//  NSDictionary+removeEmptyAndNullObjects.m
//
//  Created by Sugamiya Yusuke on 12/02/15.
//

#import "NSDictionary+removeEmptyAndNullObjects.h"

@implementation NSDictionary (NSDictionaryRemoveEmptyAndNullObjects)

- (NSDictionary*)removeEmptyObjects
{
    NSMutableDictionary* tempDic = [NSMutableDictionary dictionaryWithDictionary:self];
    return [NSDictionary dictionaryWithDictionary:[tempDic removeEmptyObjects]];
}

- (NSDictionary*)removeNullObjects
{
    NSMutableDictionary* tempDic = [NSMutableDictionary dictionaryWithDictionary:self];
    return [NSDictionary dictionaryWithDictionary:[tempDic removeNullObjects]];
}

- (NSDictionary*)removeEmptyAndNullObjects
{
    NSMutableDictionary* tempDic = [NSMutableDictionary dictionaryWithDictionary:self];
    return [NSDictionary dictionaryWithDictionary:[tempDic removeEmptyAndNullObjects]];
}

@end

 
@implementation NSMutableDictionary (NSMutableDictionaryRemoveEmptyAndNullObjects)

- (NSMutableDictionary*)removeEmptyObjects
{
    NSMutableDictionary* tempDic = [NSMutableDictionary dictionaryWithDictionary:self];
    NSMutableArray* forRemoveKeys = [NSMutableArray arrayWithArray:[tempDic allKeysForObject:@""]];
    [tempDic removeObjectsForKeys:forRemoveKeys];
    return (tempDic.count > 0)?tempDic:nil;
}

- (NSMutableDictionary*)removeNullObjects
{
    NSMutableDictionary* tempDic = [NSMutableDictionary dictionaryWithDictionary:self];
    NSMutableArray* forRemoveKeys = [NSMutableArray arrayWithArray:[tempDic allKeysForObject:_null]];
    [tempDic removeObjectsForKeys:forRemoveKeys];
    return (tempDic.count > 0)?tempDic:nil;
}

- (NSMutableDictionary*)removeEmptyAndNullObjects
{
    return [[self removeEmptyObjects] removeNullObjects];
}

@end


@implementation NSArray (NSArrayRemoveEmptyAndNullObjects)

- (NSArray*)removeEmptyObjects
{
    NSMutableArray* tempAry = [NSMutableArray arrayWithArray:self];
    return [NSArray arrayWithArray:[tempAry removeEmptyObjects]];
}

- (NSArray*)removeNullObjects
{
    NSMutableArray* tempAry = [NSMutableArray arrayWithArray:self];
    return [NSArray arrayWithArray:[tempAry removeNullObjects]];
}

- (NSArray*)removeEmptyAndNullObjects
{
    NSMutableArray* tempAry = [NSMutableArray arrayWithArray:self];
    return [NSArray arrayWithArray:[tempAry removeEmptyAndNullObjects]];
}

@end


@implementation NSMutableArray (NSMutableArrayRemoveEmptyAndNullObjects)

- (NSMutableArray*)removeEmptyObjects
{
    NSMutableArray* tempAry = [NSMutableArray arrayWithArray:self];
    [tempAry removeObject:@""];
    return (tempAry.count > 0)?tempAry:nil;
}

- (NSMutableArray*)removeNullObjects
{
    NSMutableArray* tempAry = [NSMutableArray arrayWithArray:self];
    [tempAry removeObject:_null];
    return (tempAry.count > 0)?tempAry:nil;
}

- (NSMutableArray*)removeEmptyAndNullObjects
{
    return [[self removeEmptyObjects] removeNullObjects];
}

@end