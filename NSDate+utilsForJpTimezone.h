//
//  NSDate+utilsForJpTimezone.h
//
//  Created by Sugamiya Yusuke on 12/08/22.
//

#import <Foundation/Foundation.h>

@interface NSDate (utilsForJpTimezone)

- (NSInteger)yearInteger;
- (NSInteger)weekdayInteger;
+ (NSInteger)nowYearInteger;
+ (NSInteger)nowWeekdayInteger;

- (NSString*)stringFromDateFormat:(NSString*)dateFormat;
+ (NSDate*)dateFromDateString:(NSString*)dateString dateFormat:(NSString*)dateFormat;

- (NSDate*)omitSeconds;
- (NSDate*)adjustTimeIntoToday;
- (NSDate*)adjustTimeNext24hours;

@end
