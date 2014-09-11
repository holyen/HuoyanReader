//
//  JDRenderHelper.h
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDRenderHelper : NSObject

+ (UIImage *)imageFromView:(UIView *)view;

+ (UIImage *)imageFromView:(UIView *)view withRect:(CGRect)frame;

+ (UIImage *)imageFromView:(UIView *)view withRect:(CGRect)frame
         transparentInsets:(UIEdgeInsets)insets;

+ (UIImage *)imageForAntialiasing:(UIImage *)image
                       withInsets:(UIEdgeInsets)insets;

+ (UIImage *)imageForAntialiasing:(UIImage *)image;

@end
