//
//  NSArray+makeNullArray.h
//
//  Created by Sugamiya Yusuke on 12/03/01.
//

#import <Foundation/Foundation.h>

@interface NSArray (makeNullArray)

+ (NSArray*)makeNullArrayNumberOfSize:(NSInteger)number;

@end


@interface NSMutableArray (makeNullArray)

+ (NSMutableArray*)makeNullArrayNumberOfSize:(NSInteger)number;

@end