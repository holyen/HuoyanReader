//
//  HRSliderController.h
//  HRSliderControllerDemo
//
//  Created by Rannie on 13-10-7.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassModel;

@interface HRSliderController : UIViewController

+ (id)sharedSliderController;

- (void)showContentControllerWithModel:(ClassModel *)model;

@property (nonatomic, strong) UIViewController *leftViewController;

@property (nonatomic, strong) UIViewController *rightViewController;

@end
