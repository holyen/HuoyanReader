//
//  JDSlidingViewController.m
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import "JDSlidingViewController.h"

NSString * const JDSlidingViewBackLeftWillAppearNotification    = @"ECSlidingViewUnderLeftWillAppear";
NSString * const JDSlidingViewBackRightWillAppearNotification   = @"ECSlidingViewUnderRightWillAppear";
NSString * const JDSlidingViewFrontDidAnchorLeftNotification    = @"ECSlidingViewTopDidAnchorLeft";
NSString * const JDSlidingViewFrontDidAnchorRightNotification   = @"ECSlidingViewTopDidAnchorRight";
NSString * const JDSlidingViewFrontDidResetNotification         = @"ECSlidingViewTopDidReset";


@interface JDSlidingViewController ()

@end

@implementation JDSlidingViewController

- (UIViewController *)leftBackViewController
{
    return self.underLeftViewController;
}

- (void)setLeftBackViewController:(UIViewController *)leftBackViewController
{
    self.underLeftViewController = leftBackViewController;
}

- (UIViewController *)rightBackViewController
{
    return self.underRightViewController;
}

- (void)setRightBackViewController:(UIViewController *)rightBackViewController
{
    self.underRightViewController = rightBackViewController;
}

- (UIViewController *)frontViewController
{
    return self.topViewController;
}

- (void)setFrontViewController:(UIViewController *)frontViewController
{
    self.topViewController = frontViewController;
}

- (CGFloat)anchorLeftPeekAmount
{
    return [super anchorLeftPeekAmount];
}

- (void)setAnchorLeftPeekAmount:(CGFloat)anchorLeftPeekAmount
{
    [super setAnchorLeftPeekAmount:anchorLeftPeekAmount];
}

- (CGFloat)anchorRightPeekAmount
{
    return [super anchorRightPeekAmount];
}

- (void)setAnchorRightPeekAmount:(CGFloat)anchorRightPeekAmount
{
    [super setAnchorRightPeekAmount:anchorRightPeekAmount];
}

- (CGFloat)anchorLeftRevealAmount
{
    return [super anchorLeftRevealAmount];
}

- (void)setAnchorLeftRevealAmount:(CGFloat)anchorLeftRevealAmount
{
    [super setAnchorLeftRevealAmount:anchorLeftRevealAmount];
}

- (CGFloat)anchorRightRevealAmount
{
    return [super anchorRightRevealAmount];
}

- (void)setAnchorRightRevealAmount:(CGFloat)anchorRightRevealAmount
{
    [super setAnchorRightRevealAmount:anchorRightRevealAmount];
}

- (BOOL)shouldAllowUserInteractionsWhenAnchored
{
    return [super shouldAllowUserInteractionsWhenAnchored];
}

- (void)setShouldAllowUserInteractionsWhenAnchored:(BOOL)shouldAllowUserInteractionsWhenAnchored
{
    [super setShouldAllowUserInteractionsWhenAnchored:shouldAllowUserInteractionsWhenAnchored];
}

- (BOOL)shouldAddPanGestureRecognizerToFrontViewSnapshot
{
    return [super shouldAddPanGestureRecognizerToTopViewSnapshot];
}

- (void)setShouldAddPanGestureRecognizerToFrontViewSnapshot:(BOOL)shouldAddPanGestureRecognizerToFrontViewSnapshot
{
    [super setShouldAddPanGestureRecognizerToTopViewSnapshot:shouldAddPanGestureRecognizerToFrontViewSnapshot];
}

- (JDSlidingBackViewLayout)leftBackViewLayout
{
    return (JDSlidingBackViewLayout)self.underLeftWidthLayout;
}

- (void)setLeftBackViewLayout:(JDSlidingBackViewLayout)leftBackViewLayout
{
    self.underLeftWidthLayout = leftBackViewLayout;
}

- (JDSlidingBackViewLayout)rightBackViewLayout
{
    return (JDSlidingBackViewLayout)self.underRightWidthLayout;
}

- (void)setRightBackViewLayout:(JDSlidingBackViewLayout)rightBackViewLayout
{
    self.underRightWidthLayout = rightBackViewLayout;
}

- (JDSlidingResetMethod)resetMethod
{
    return (JDSlidingResetMethod)self.resetStrategy;
}

- (void)setResetMethod:(JDSlidingResetMethod)resetMethod
{
    self.resetStrategy = resetMethod;
}

- (UIPanGestureRecognizer *)panGesture
{
    return [super panGesture];
}

- (void)anchorFrontViewTo:(JDSlidingSide)side;
{
    [self anchorTopViewTo:(ECSide)side];
}

- (void)anchorFrontViewTo:(JDSlidingSide)side
               animations:(void(^)())animations
               onComplete:(void(^)())complete
{
    [self anchorTopViewTo:(ECSide)side animations:animations onComplete:complete];
}

- (void)anchorFrontViewOffScreenTo:(JDSlidingSide)side
{
    [self anchorTopViewOffScreenTo:(ECSide)side];
}

- (void)anchorFrontViewOffScreenTo:(JDSlidingSide)side
                        animations:(void(^)())animations
                        onComplete:(void(^)())complete;
{
    [self anchorTopViewOffScreenTo:(ECSide)side animations:animations onComplete:complete];
}

- (void)resetFrontView
{
    [self resetTopView];
}

- (void)resetFrontViewWithAnimations:(void(^)())animations onComplete:(void(^)())complete
{
    [self resetTopViewWithAnimations:animations onComplete:complete];
}

- (BOOL)leftBackViewShowing
{
    return [self underLeftShowing];
}

- (BOOL)rightBackViewShowing
{
    return [self underRightShowing];
}

- (BOOL)isFrontViewOffScreen
{
    return [self topViewIsOffScreen];
}

@end

@implementation UIViewController (ADSlidingViewController)

- (JDSlidingViewController *)slidingController
{
    return (JDSlidingViewController *) [self slidingViewController];
}

@end
