//
//  UIViewController+UKChildViewController.h
//  Uklon
//
//  Created by Dmytro on 4/29/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extended)
- (void)addAsChildViewControllerTo:(UIViewController *)viewController inView:(UIView *)view;
- (void)removeViewControllerFromParent;
@end
