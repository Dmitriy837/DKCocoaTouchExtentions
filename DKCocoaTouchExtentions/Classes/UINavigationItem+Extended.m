//
//  UINavigationItem+UKSpacerWidth.m
//  tryLamberjack
//
//  Created by Dmytro on 8/3/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "UINavigationItem+Extended.h"

@implementation UINavigationItem (Extended)
- (CGFloat)spacerWidth
{
    NSArray *rightBarButtonItems = self.rightBarButtonItems;
    UIBarButtonItem *item = rightBarButtonItems.lastObject;
    CGRect itemFrame = [(UIView *)[item performSelector:@selector(view)] frame];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat spacerWidth = screenWidth - itemFrame.origin.x - itemFrame.size.width;
    return spacerWidth;
}

- (void)alignToRight
{
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = - [self spacerWidth];
    self.rightBarButtonItems = [@[spacer] arrayByAddingObjectsFromArray:self.rightBarButtonItems];
}
@end
