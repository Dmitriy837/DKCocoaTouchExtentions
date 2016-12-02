//
//  UIView+Rotation.m
//  awesomeBubbleView
//
//  Created by Dmytro on 6/23/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "UIView+Rotation.h"

@implementation UIView (Rotation)

- (void)startRotating
{
    [self startRotatingToAngle: - M_PI * 2.0 withDuration:1.0f];
}

- (void)stopRotating
{
    [self.layer removeAllAnimations];
}

- (void)startRotatingToAngle:(CGFloat)angle withDuration:(CFTimeInterval)duration;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:angle];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end
