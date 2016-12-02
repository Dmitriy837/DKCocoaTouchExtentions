//
//  UIView+Image.m
//  Uklon
//
//  Created by Dmytro on 3/28/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "UIView+Extended.h"

@implementation UIView (Extended)
- (UIImage *)imageFromView
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(self.frame.size);
    }
    [self.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)makeRounded
{
    [self addRoundedBorderOfWidth:0 andColor:nil];
}

- (void)makeRoundedWithCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)addRoundedBorderOfWidth:(CGFloat)borderWidth andColor:(UIColor *)borderColor
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor =  borderColor.CGColor;
    self.layer.cornerRadius = self.bounds.size.height / 2;
    self.layer.masksToBounds = YES;
}

- (void)alignView:(UIView*)view toRepeatFrameOf:(UIView*)originalView
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:originalView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:originalView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:originalView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:originalView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
}

- (UIView*)addViewRepeatingFrameOf:(UIView*)originalView
{
    UIView *copyView = [UIView new];
    copyView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:copyView];
    [self alignView:copyView toRepeatFrameOf:originalView];
    return copyView;
}

@end
