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
    NSLocale* jpLocale             = DNPP_AUTORELEASE([[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr]);
    NSTimeZone* jpTimeZone         = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    NSDateFormatter* dateFormatter = DNPP_AUTORELEASE([[NSDateFormatter alloc] init]);
    [dateFormatter setDateFormat:@"yyyy"];
    [dateFormatter setLocale:jpLocale];
    [dateFormatter setTimeZone:jpTimeZone];
    
    NSDate* nowDate  = [NSDate date];
    NSString* result = [dateFormatter stringFromDate:nowDate];
    
    NSInteger year = [result integerValue];
    
    dateFormatter = nil, jpLocale = nil, jpTimeZone = nil;
    
    return year;
}

 + (NSInteger)nowJpWeekdayInteger
{
    NSLocale*   jpLocale   = DNPP_AUTORELEASE([[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr]);
    NSTimeZone* jpTimeZone = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    NSCalendar* calendar   = DNPP_AUTORELEASE([[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]);
    [calendar setLocale:jpLocale];
    [calendar setTimeZone:jpTimeZone];
    
    NSDate* nowDate     = [NSDate date];
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

+ (NSString*)easyDateFormatterForJp:(NSString*)dateFormat date:(NSDate*)date
{
    NSLocale* jpLocale             = DNPP_AUTORELEASE([[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr]);
    NSTimeZone* jpTimeZone         = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    NSDateFormatter* dateFormatter = DNPP_AUTORELEASE([[NSDateFormatter alloc] init]);
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:jpLocale];
    [dateFormatter setTimeZone:jpTimeZone];
    
    if (!date) date = [NSDate date];
    NSString* result = [dateFormatter stringFromDate:date];
    
    dateFormatter = nil, jpLocale = nil, jpTimeZone = nil;
    
    return result;
}

+ (NSDate*)easyDateFormatterForJp:(NSString*)dateFormat dateString:(NSString*)dateString
{
    if (!dateFormat && !dateString)
        return nil;
    
    NSLocale* jpLocale             = DNPP_AUTORELEASE([[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr]);
    NSTimeZone* jpTimeZone         = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    NSDateFormatter* dateFormatter = DNPP_AUTORELEASE([[NSDateFormatter alloc] init]);
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:jpLocale];
    [dateFormatter setTimeZone:jpTimeZone];
    
    NSDate* result = [dateFormatter dateFromString:dateString];
    
    dateFormatter = nil, jpLocale = nil, jpTimeZone = nil;
    
    return result;
}


@end
