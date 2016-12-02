//
//  NSMutableArray+Unique.h
//  Uklon
//
//  Created by Dmytro on 4/4/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Unique)
- (void)addUniqueObjectsFromArray:(NSArray*)array;
- (NSArray*)uniqueObjectsFromArray:(NSArray*)array;
@end
