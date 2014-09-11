//
//  JDRootViewController.h
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import "JDSlidingViewController.h"
#import "JDMenuViewController.h"
#import "JDFollowBooksViewController.h"

@interface JDRootViewController : JDSlidingViewController
{
    JDMenuViewController *_menuViewController;
}

- (void)loadLeftBackViewController;
- (void)loadRightBackViewController;

@end
