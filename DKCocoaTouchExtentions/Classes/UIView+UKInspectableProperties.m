//
//  UIView+UKInspectableProperties.m
//  Uklon
//
//  Created by Dmytro on 4/27/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "UIView+UKInspectableProperties.h"

@implementation UIView (UKInspectableProperties)
@dynamic borderColor,borderWidth,cornerRadius;
-(void)setBorderColor:(UIColor *)borderColor{
    [self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    [self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
    self.layer.masksToBounds = cornerRadius > 0;
}
@end
