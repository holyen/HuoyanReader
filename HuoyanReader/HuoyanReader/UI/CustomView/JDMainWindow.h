//
//  JDMainWindow.h
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDRootViewController.h"
#import "JDLoginViewController.h"

@interface JDMainWindow : UIWindow

- (void)setRootViewController:(UIViewController *)rootViewController
                     animated:(BOOL)animated;

- (void)transitionToMainViewController;

- (void)transitionToLoginViewController;

@end
