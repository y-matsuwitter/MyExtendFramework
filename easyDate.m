//
//  easyDate.m
//
//  Created by Sugamiya Yusuke on 12/03/05.
//

#import "easyDate.h"

#define jpLocaleStr   @"ja_JP"
#define jpTimeZoneStr @"JST"

@implementation easyDate

+ (NSInteger)nowJpYearInteger
{
    NSLocale* jpLocale = [[[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr] autorelease];
    NSTimeZone* jpTimeZone = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy"];
    [dateFormatter setLocale:jpLocale];
    [dateFormatter setTimeZone:jpTimeZone];
    
    NSDate* nowDate = [NSDate date];
    NSString* result = [dateFormatter stringFromDate:nowDate];
    
    NSInteger year = [result integerValue];
    dateFormatter = nil, jpLocale = nil, jpTimeZone = nil;
    
    return year;
}

 + (NSInteger)nowJpWeekdayInteger
{
    NSLocale*   jpLocale = [[[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr] autorelease];
    NSTimeZone* jpTimeZone = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    NSCalendar* calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    [calendar setLocale:jpLocale];
    [calendar setTimeZone:jpTimeZone];
    
    NSDate* nowDate = [NSDate date];
    NSInteger unitFlags = NSWeekdayCalendarUnit;
    NSDateComponents* weekDayComponents = [calendar components:unitFlags fromDate:nowDate];
    
    NSInteger i = [weekDayComponents weekday];
    jpLocale = nil, jpTimeZone = nil, nowDate = nil, weekDayComponents = nil;
    
    return i;
}

+ (NSInteger)nowJpWeekdayIntegerForSugojika
{
    NSInteger i = [self nowJpWeekdayInteger];
    i--; if (i == 0) i = 7;
    return i;
}

@end
