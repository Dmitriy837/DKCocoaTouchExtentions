//
//  NSDateFormatter+UKDatePresets.h
//  Uklon
//
//  Created by Dmytro on 4/20/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Presets)
+ (NSDateFormatter*)iso8061Formatter;
+ (NSDateFormatter*)shortReadableFormat;
+ (NSDateFormatter *)shortReadableFormatWithOutTime;

+ (NSString*)shortestTimeStringFromDate:(NSDate*)date;

+ (NSString*)dayOnlyFromDate:(NSDate*)date;
+ (NSString*)minutesFromDate:(NSDate*)date;
+ (NSString*)hoursFromDate:(NSDate*)date;
+ (NSString*)weekdayFromDate:(NSDate*)date;

+ (NSInteger)minutesValueFromDate:(NSDate*)date;
+ (NSInteger)hoursValueFromDate:(NSDate*)date;
@end
