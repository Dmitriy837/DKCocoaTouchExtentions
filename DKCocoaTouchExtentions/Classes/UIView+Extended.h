//
//  UIView+Image.h
//  Uklon
//
//  Created by Dmytro on 3/28/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extended)
- (UIImage *)imageFromView;
- (void)makeRounded;
- (void)makeRoundedWithCornerRadius:(CGFloat)cornerRadius;
- (void)addRoundedBorderOfWidth:(CGFloat)borderWidth andColor:(UIColor*)borderColor;
- (UIView*)addViewRepeatingFrameOf:(UIView*)originalView;
- (void)alignView:(UIView*)view toRepeatFrameOf:(UIView*)originalView;
@end
