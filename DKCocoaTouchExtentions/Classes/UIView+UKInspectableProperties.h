//
//  UIView+UKInspectableProperties.h
//  Uklon
//
//  Created by Dmytro on 4/27/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (UKInspectableProperties)
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@end
