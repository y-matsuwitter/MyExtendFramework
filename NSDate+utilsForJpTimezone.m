//
//  NSDate+utilsForJpTimezone.m
//
//  Created by Sugamiya Yusuke on 12/08/22.
//

#import "NSDate+utilsForJpTimezone.h"
#import "DPDateHelper.h"

@implementation NSDate (utilsForJpTimezone)

#pragma mark -

- (NSInteger)yearInteger
{
    NSDateFormatter* dateFormatter = [DPDateHelper standardJpDateFormatterWithDateFormat:@"yyyy"];
    return [[dateFormatter stringFromDate:self] integerValue];
}

- (NSInteger)weekdayInteger
{
    NSCalendar* calendar = [DPDateHelper standardJpCalendar];
    NSDateComponents* weekDayComponents = [calendar components:(NSWeekdayCalendarUnit)
                                                      fromDate:self];
    return [weekDayComponents weekday];
}

+ (NSInteger)nowYearInteger
{
    return [[[self class] date] yearInteger];
}

+ (NSInteger)nowWeekdayInteger
{
    return [[[self class] date] weekdayInteger];
}

#pragma mark -

- (NSString*)stringFromDateFormat:(NSString*)dateFormat
{
    if (!dateFormat) return nil;
    
    NSDateFormatter* dateFormatter = [DPDateHelper standardJpDateFormatterWithDateFormat:dateFormat];
    return [dateFormatter stringFromDate:self];
}

+ (NSDate*)dateFromDateString:(NSString*)dateString dateFormat:(NSString*)dateFormat
{
    if (!dateString || !dateFormat) return nil;
    
    NSDateFormatter* dateFormatter = [DPDateHelper standardJpDateFormatterWithDateFormat:dateFormat];
    return [dateFormatter dateFromString:dateString];
}

#pragma mark -

- (NSDate*)omitSeconds
{
    NSString* omittedString = [self stringFromDateFormat:@"yyyyMMddHHmm"];
    omittedString = [NSString stringWithFormat:@"%@%@", omittedString, @"00"];
    return [NSDate dateFromDateString:omittedString dateFormat:@"yyyyMMddHHmmss"];
}

- (NSDate*)adjustTimeIntoToday
{
    NSString* timeString  = [self stringFromDateFormat:@"HHmmss"];
    NSString* todayString = [[[self class] date] stringFromDateFormat:@"yyyyMMdd"];
    return [NSDate dateFromDateString:[NSString stringWithFormat:@"%@%@", todayString, timeString] dateFormat:@"yyyyMMddHHmmss"];
}

- (NSDate *)adjustTimeNext24hours
{
    NSDate* resultDate = [self adjustTimeIntoToday];
    if ([resultDate timeIntervalSinceNow] < 0) {
        resultDate = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:resultDate];
    }
    return resultDate;
}

@end
