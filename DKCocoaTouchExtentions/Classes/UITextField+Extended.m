//
//  UITextField+Extended.m
//  SecureAtWork
//
//  Created by Dmitriy Kovryhin on 4/30/15.
//  Copyright (c) 2015 Dmitriy Kovryhin. All rights reserved.
//

#import "UITextField+Extended.h"

@implementation UITextField (Extended)
- (void)setPlaceholderColor:(UIColor *)color
{
    if (!self.placeholder) self.placeholder = @" ";
    NSAttributedString *placeholderString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{ NSForegroundColorAttributeName : color }];
    self.attributedPlaceholder = placeholderString;
}

- (BOOL)isNotEmpty
{
    return self.text.length > 0;
}
@end
