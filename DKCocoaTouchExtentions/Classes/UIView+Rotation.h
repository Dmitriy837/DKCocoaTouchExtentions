//
//  UIView+Rotation.h
//  awesomeBubbleView
//
//  Created by Dmytro on 6/23/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rotation)
- (void)startRotating;
- (void)stopRotating;
- (void)startRotatingToAngle:(CGFloat)angle withDuration:(CFTimeInterval)duration;
@end
