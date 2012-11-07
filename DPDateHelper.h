//
//  DPDateHelper.h
//
//  Created by Sugamiya Yusuke on 12/08/22.
//

#import <Foundation/Foundation.h>

@interface DPDateHelper : NSObject

+ (NSDateFormatter*)standardJpDateFormatterWithDateFormat:(NSString*)dateFormat;
+ (NSCalendar*)standardJpCalendar;

@end
