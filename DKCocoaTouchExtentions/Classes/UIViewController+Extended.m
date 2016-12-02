//
//  UIViewController+UKChildViewController.m
//  Uklon
//
//  Created by Dmytro on 4/29/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "UIViewController+Extended.h"

@implementation UIViewController (Extended)
- (void)addAsChildViewControllerTo:(UIViewController *)viewController inView:(UIView *)view
{
    [viewController addChildViewController:self];
    [view addSubview:self.view];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self didMoveToParentViewController:viewController];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|" options:0 metrics:nil views:@{@"table":self.view}]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|" options:0 metrics:nil views:@{@"table":self.view}]];
    [view layoutIfNeeded];
}

- (void)removeViewControllerFromParent
{
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
