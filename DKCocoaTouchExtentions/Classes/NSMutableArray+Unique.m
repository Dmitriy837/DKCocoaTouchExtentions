//
//  NSMutableArray+Unique.m
//  Uklon
//
//  Created by Dmytro on 4/4/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "NSMutableArray+Unique.h"

@implementation NSMutableArray (Unique)
- (void)addUniqueObjectsFromArray:(NSArray*)array
{
    [self addObjectsFromArray:[self uniqueObjectsFromArray:array]];
}

- (NSArray *)uniqueObjectsFromArray:(NSArray *)array
{
    NSSet *initialSet = [NSSet setWithArray:self];
    NSMutableSet *setToAdd = [NSMutableSet setWithArray:array];
    [setToAdd minusSet:initialSet];
    NSArray *arrayOfUniqueObjects = [setToAdd allObjects];
    return arrayOfUniqueObjects;
}
@end
