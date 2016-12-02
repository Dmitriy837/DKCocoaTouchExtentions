//
//  NSDateFormatter+UKDatePresets.m
//  Uklon
//
//  Created by Dmytro on 4/20/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "NSDateFormatter+Presets.h"
#import "NSDate+Days.h"

@implementation NSDateFormatter (Presets)
+ (NSDateFormatter *)iso8061Formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    return dateFormatter;
}

+ (NSDateFormatter *)timeOnlyFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:@"HH:mm"];
    return dateFormatter;
}

+ (NSDateFormatter *)shortReadableFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:@"dd.MM.YYYY / HH:mm"];
    return dateFormatter;
}

+ (NSDateFormatter *)shortReadableFormatWithOutTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:@"dd.MM.YYYY"];
    return dateFormatter;
}

+ (NSString*)shortestTimeStringFromDate:(NSDate*)date
{
    if ([date isWithinNext24Hours])
    {
        return [[self timeOnlyFormat] stringFromDate:date];
    }
    return [[self shortReadableFormat] stringFromDate:date];
}

+ (NSString*)dayOnlyFromDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [self shortReadableFormat];
    [dateFormatter setDateFormat:@"dd"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString*)minutesFromDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [self shortReadableFormat];
    [dateFormatter setDateFormat:@"mm"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString*)hoursFromDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [self shortReadableFormat];
    [dateFormatter setDateFormat:@"HH"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString*)weekdayFromDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [self shortReadableFormat];
    [dateFormatter setDateFormat:@"EE"];
    return [dateFormatter stringFromDate:date];
}

+ (NSInteger)minutesValueFromDate:(NSDate*)date
{
    return [[self minutesFromDate:date] integerValue];
}

+ (NSInteger)hoursValueFromDate:(NSDate*)date
{
    return [[self hoursFromDate:date] integerValue];
}

@end
