//
//  NSString+Sizes.m
//  Uklon
//
//  Created by Dmytro on 2/16/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#import "NSString+Sizes.h"

@implementation NSString (Sizes)

- (CGFloat)widthWithFont:(UIFont *)font
{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:self attributes:attributes] size].width;
}

- (CGFloat)heigthWithWidth:(CGFloat)width andFont:(UIFont *)font
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attrStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [self length])];
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    return rect.size.height;
}

- (CGSize)sizeWithWidth:(CGFloat)width andFont:(UIFont *)font
{
    return CGSizeMake(width, [self heigthWithWidth:width andFont:font]);
}

@end
