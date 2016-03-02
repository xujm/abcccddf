//
//  CKNUtils.m
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import "CKNUtils.h"

@implementation CKNUtils

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *colorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return colorImg;
}

@end
