//
//  UIImage+colorImg.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "UIImage+colorImg.h"

@implementation UIImage (colorImg)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
   
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
