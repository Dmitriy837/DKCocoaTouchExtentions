//
//  NSObject+Extended.h
//  Uklon
//
//  Created by Dmytro on 2/22/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extended)
//Can be nil
- (NSString*)toString;
//Guaranteed to be at least empty string
+ (NSString*)toString:(id)obj;

extern id ObjectOrNull(id object);
@end
