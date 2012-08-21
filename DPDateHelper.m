//
//  DPDateHelper.m
//
//  Created by Sugamiya Yusuke on 12/08/22.
//

#import "DPDateHelper.h"

@implementation DPDateHelper

static NSString* jpLocaleStr   = @"ja_JP";
static NSString* jpTimeZoneStr = @"JST";

+ (NSDateFormatter*)standardJpDateFormatterWithDateFormat:(NSString*)dateFormat
{
    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    if (dateFormat) [dateFormatter setDateFormat:dateFormat];
    
    // for Japanese
    NSLocale* jpLocale = [[[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr] autorelease];
    [dateFormatter setLocale:jpLocale];
    NSTimeZone* jpTimeZone = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    [dateFormatter setTimeZone:jpTimeZone];
    
    return dateFormatter;
}

+ (NSCalendar*)standardJpCalendar
{
    NSCalendar* calendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    // for Japanese
    NSLocale* jpLocale = [[[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr] autorelease];
    [calendar setLocale:jpLocale];
    NSTimeZone* jpTimeZone = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    [calendar setTimeZone:jpTimeZone];
    
    return calendar;
}

@end
