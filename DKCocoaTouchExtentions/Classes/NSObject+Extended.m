//
//  NSObject+Extended.m
//  Uklon
//
//  Created by Dmytro on 2/22/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "NSObject+Extended.h"

@implementation NSObject (Extended)
- (NSString*)toString
{
    if ([self isKindOfClass:[NSString class]])
    {
        return (NSString*)self;
    }
    else if ([self respondsToSelector:@selector(stringValue)])
    {
        return [(NSValue*)self stringValue];
    }
    else return nil;
}

+ (NSString*)toString:(id)obj
{
    obj = [obj toString];
    if (obj) return obj;
    else return @"";
}

id ObjectOrNull(id object)
{
    return object ?: [NSNull null];
}
@end
