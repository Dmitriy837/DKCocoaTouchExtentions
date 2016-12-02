//
//  NSString+Sizes.h
//  Uklon
//
//  Created by Dmytro on 2/16/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Sizes)
- (CGFloat)widthWithFont:(UIFont *)font;
- (CGFloat)heigthWithWidth:(CGFloat)width andFont:(UIFont *)font;
- (CGSize)sizeWithWidth:(CGFloat)width andFont:(UIFont *)font;
@end
