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
    NSDateFormatter* dateFormatter = DNPP_AUTORELEASE([[NSDateFormatter alloc] init]);
    if (dateFormat) [dateFormatter setDateFormat:dateFormat];
    
    // for Japanese
    NSLocale* jpLocale = DNPP_AUTORELEASE([[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr]);
    [dateFormatter setLocale:jpLocale];
    NSTimeZone* jpTimeZone = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    [dateFormatter setTimeZone:jpTimeZone];
    
    return dateFormatter;
}

+ (NSCalendar*)standardJpCalendar
{
    NSCalendar* calendar = DNPP_AUTORELEASE([[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]);
    
    // for Japanese
    NSLocale* jpLocale = DNPP_AUTORELEASE([[NSLocale alloc] initWithLocaleIdentifier:jpLocaleStr]);
    [calendar setLocale:jpLocale];
    NSTimeZone* jpTimeZone = [NSTimeZone timeZoneWithName:jpTimeZoneStr];
    [calendar setTimeZone:jpTimeZone];
    
    return calendar;
}

@end
