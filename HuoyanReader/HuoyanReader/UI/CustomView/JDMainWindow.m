//
//  JDMainWindow.m
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import "JDMainWindow.h"
#import "JDRenderHelper.h"

#define DEGREES_TO_RADIANS(degrees) (degrees * M_PI / 180)

@implementation JDMainWindow

static CGAffineTransform transformForOrientation(UIInterfaceOrientation orientation)
{
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
            
        case UIInterfaceOrientationLandscapeRight:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(-90));
            
        case UIInterfaceOrientationPortraitUpsideDown:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
            
        case UIInterfaceOrientationPortrait:
        default:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
    }
}

- (void)translateToViewController:(UIViewController *)viewController
{
    UIView *fromView = self;
    CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    UIImage *fromViewImage = [JDRenderHelper imageFromView:fromView withRect:appFrame];
    CALayer *fromLayer = [CALayer layer];
    fromLayer.frame = appFrame;
    fromLayer.contents = (id)fromViewImage.CGImage;
    fromLayer.name = @"com.anydata.db.view.layer.from";
    
    // *CAUTION* __MUST__ dismiss rootViewController's presentedViewController before release it.
    if (self.rootViewController.presentedViewController) {
        [self.rootViewController dismissViewControllerAnimated:NO completion:NULL];
    }
    
    self.rootViewController = viewController;
    UIView *toView = self.rootViewController.view;
    
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = toView.bounds;
    [toView.layer addSublayer:containerLayer];
    
    CGFloat width = containerLayer.bounds.size.width;
    CGFloat height = containerLayer.bounds.size.height;
    
    // UIWindow will never rotate. So we take rotation into account and make transform manually
    UIInterfaceOrientation o = [UIApplication sharedApplication].statusBarOrientation;
    CGAffineTransform aff = transformForOrientation(o);
    fromLayer.transform = CATransform3DMakeAffineTransform(aff);
    
    // UIWindow's frame is not fixed. So we make adjustment here
    CGFloat fromHeight = UIInterfaceOrientationIsLandscape(o) ? fromLayer.bounds.size.width : fromLayer.bounds.size.height;
    CGFloat revise = fromHeight - height;
    fromLayer.position = CGPointMake(width / 2, height / 2 - revise / 2);
    //toLayer.position = CGPointMake(width * 1.5, height / 2);
    
    [containerLayer addSublayer:fromLayer];
    //[containerLayer addSublayer:toLayer];
    
    dispatch_block_t translation = ^ {
        [CATransaction begin];
        [CATransaction setAnimationDuration:.3];
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [CATransaction setCompletionBlock:^ {
            [containerLayer removeFromSuperlayer];
        }];
        
        CGFloat offset = -toView.bounds.size.width;
        CGPoint newPos = fromLayer.position;
        newPos.x += offset;
        fromLayer.position = newPos;
        
        //newPos = toLayer.position;
        //newPos.x += offset;
        //toLayer.position = newPos;
        
        [CATransaction commit];
    };
    
    [self performSelector:@selector(performBlock:) withObject:[translation copy] afterDelay:0.1];
}

- (void)setRootViewController:(UIViewController *)rootViewController
                     animated:(BOOL)animated
{
    if (self.rootViewController && rootViewController && animated) {
        [self translateToViewController:rootViewController];
    } else {
        [super setRootViewController:rootViewController];
    }
}

- (void)transitionToMainViewController
{
    NSString *vcStr = @"JDRootViewController";
    JDRootViewController *mainVC = [[NSClassFromString(vcStr) alloc] initWithNibName:vcStr bundle:nil];
    [self setRootViewController:mainVC animated:YES];
}

- (void)transitionToLoginViewController
{
    NSString *vcStr = @"JDLoginViewController";
    JDLoginViewController *loginVC = [[NSClassFromString(vcStr) alloc] initWithNibName:nil bundle:nil];
    [self setRootViewController:loginVC animated:YES];
}
@end
