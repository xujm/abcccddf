//
//  CKNUtils.h
//  ConsultNews
//
//  Created by Lx on 16/3/1.
//  Copyright © 2016年 Lx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKNUtils : NSObject

/**
 *  根据制定颜色和大小生成UIImage对象
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return UIImage
 */

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
