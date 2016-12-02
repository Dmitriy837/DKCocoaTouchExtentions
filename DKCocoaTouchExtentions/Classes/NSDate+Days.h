//
//  NSDate+Days.h
//  Uklon
//
//  Created by Dmytro on 3/10/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Days)
+ (NSInteger)daysBetweenDate:(NSDate*)date1 andDate:(NSDate*)date2;
+ (NSInteger)minutesBetween:(NSDate*)date1 and:(NSDate*)date2;
+ (NSInteger)currentYear;
- (NSDate*)setHours:(NSInteger)hours;
- (NSDate*)setMinutes:(NSInteger)minutes;
- (NSDate*)setDayFromDate:(NSDate*)date;
- (BOOL)isWithinNext24Hours;
@end
