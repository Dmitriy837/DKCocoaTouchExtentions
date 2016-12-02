//
//  NSDate+Days.m
//  Uklon
//
//  Created by Dmytro on 3/10/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "NSDate+Days.h"

@implementation NSDate (Days)
+ (NSInteger)daysBetweenDate:(NSDate*)date1 andDate:(NSDate*)date2
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:date1];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:date2];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

+ (NSInteger)hoursBetweenDate:(NSDate*)date1 andDate:(NSDate*)date2
{
    NSUInteger unitFlags = NSCalendarUnitHour;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:unitFlags fromDate:date1 toDate:date2 options:0];
    return [components hour];
}


+ (NSInteger)minutesBetween:(NSDate*)date1 and:(NSDate*)date2
{
    NSTimeInterval distanceBetweenDates = [date1 timeIntervalSinceDate:date2];
    double secondsInAnMinute = 60;
    NSInteger minutesBetweenDates = distanceBetweenDates / secondsInAnMinute;
    return labs(minutesBetweenDates);
}

+ (NSInteger)currentYear
{
    NSDate *currDate = [NSDate date];
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* components = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:currDate];
    NSInteger year = [components year];
    return year;
}

- (NSDate*)setHours:(NSInteger)hours
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate:self];
    [components setHour: hours];
    return [gregorian dateFromComponents: components];
}

- (NSDate*)setMinutes:(NSInteger)minutes
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate:self];
    [components setMinute:minutes];
    return [gregorian dateFromComponents: components];
}

- (NSDate*)setDayFromDate:(NSDate*)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *oldComponents = [gregorian components: NSUIntegerMax fromDate:self];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate:date];
    [oldComponents setDay:components.day];
    [oldComponents setMonth:components.month];
    return [gregorian dateFromComponents: oldComponents];
}

- (BOOL)isWithinNext24Hours
{
    return [NSDate hoursBetweenDate:self andDate:[NSDate date]] < 24;
}
@end
