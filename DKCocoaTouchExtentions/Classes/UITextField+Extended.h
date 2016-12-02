//
//  UITextField+Extended.h
//  SecureAtWork
//
//  Created by Dmitriy Kovryhin on 4/30/15.
//  Copyright (c) 2015 Dmitriy Kovryhin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extended)
//Set placeholder value first!
- (void)setPlaceholderColor:(UIColor*)color;

- (BOOL)isNotEmpty;
@end
