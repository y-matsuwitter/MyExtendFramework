//
//  easyDate.m
//
//  Created by Sugamiya Yusuke on 12/03/05.
//
//
//  !!!!!!       Deprecated       !!!!!!
//  !!!!!! This class is obsolete !!!!!!
//

#import "easyDate.h"
#import "NSDate+utilsForJpTimezone.h"

@implementation easyDate

+ (NSInteger)nowJpYearInteger
{
    return [NSDate nowYearInteger];
}

+ (NSInteger)nowJpWeekdayInteger
{
    return [NSDate nowWeekdayInteger];
}

+ (NSInteger)nowJpWeekdayIntegerForSugojika
{
    NSInteger i = [self nowJpWeekdayInteger];
    i--; if (i == 0) i = 7;
    return i;
}

+ (NSString*)easyDateFormatterForJp:(NSString*)dateFormat date:(NSDate*)date
{
    if (!date) date = [NSDate date];
    
    return [date stringFromDateFormat:dateFormat];
}

+ (NSDate*)easyDateFormatterForJp:(NSString*)dateFormat dateString:(NSString*)dateString
{
    return [NSDate dateFromDateString:dateString dateFormat:dateFormat];
}

@end
