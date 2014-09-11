//
//  JDRootViewController.m
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import "JDRootViewController.h"

@interface JDRootViewController ()

@end

@implementation JDRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.shouldAddPanGestureRecognizerToFrontViewSnapshot = YES;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[JDFollowBooksViewController alloc] initWithNibName:nil bundle:nil]];
    [self setFrontViewController:navController];
    [self loadLeftBackViewController];
    [self loadRightBackViewController];
}

- (void)loadLeftBackViewController
{
    self.anchorRightPeekAmount = 49.f;
    _menuViewController = [[JDMenuViewController alloc] initWithNibName:nil bundle:nil];
    self.leftBackViewController = _menuViewController;
}

- (void)loadRightBackViewController
{
    //implement this method in subclasses
}

@end
