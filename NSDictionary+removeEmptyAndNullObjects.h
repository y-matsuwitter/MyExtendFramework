//
//  NSDictionary+removeEmptyAndNullObjects.h
//
//  Created by Sugamiya Yusuke on 12/02/15.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NSDictionaryRemoveEmptyAndNullObjects)

- (NSDictionary*)removeEmptyObjects;
- (NSDictionary*)removeNullObjects;
- (NSDictionary*)removeEmptyAndNullObjects;

@end


@interface NSMutableDictionary (NSMutableDictionaryRemoveEmptyAndNullObjects)

- (NSMutableDictionary*)removeEmptyObjects;
- (NSMutableDictionary*)removeNullObjects;
- (NSMutableDictionary*)removeEmptyAndNullObjects;

@end


@interface NSArray (NSArrayRemoveEmptyAndNullObjects)

- (NSArray*)removeEmptyObjects;
- (NSArray*)removeNullObjects;
- (NSArray*)removeEmptyAndNullObjects;

@end


@interface NSMutableArray (NSMutableArrayRemoveEmptyAndNullObjects)

- (NSMutableArray*)removeEmptyObjects;
- (NSMutableArray*)removeNullObjects;
- (NSMutableArray*)removeEmptyAndNullObjects;

@end
