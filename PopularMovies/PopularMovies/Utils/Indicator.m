//
//  Indicator.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "Indicator.h"

// Pods
#import "MBProgressHUD.h"

// Utils
#import "Validator.h"

@implementation Indicator {
    MBProgressHUD *HUD;
}

+(instancetype)shared {
    
    static Indicator *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [Indicator new];
    });
    
    return _shared;
    
}

-(void)showIndicatorWithViewController:(UIViewController *)viewController {
    
    [self stopIndicatorInViewController:viewController];
    
    [self showIndicatorWithLabel:nil delegate:viewController view:viewController.view];
    
}

-(void)showIndicatorWithLabel:(NSString *)label viewController:(UIViewController *)viewController  {
    
    [self stopIndicatorInViewController:viewController];
    
    [self showIndicatorWithLabel:label delegate:viewController view:viewController.view];
    
}

-(void)showIndicatorWithLabel:(NSString *)label delegate:(id)delegate view:(UIView *)view {
    
    [self stopIndicatorInView:view];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    [[delegate class] conformsToProtocol:@protocol(MBProgressHUDDelegate)];
    
    HUD.delegate = delegate;
    
    if ( ! [Validator isEmptyString:label] )
        HUD.label.text = label;
    
}

-(void)showIndicatorDialogWithMessage:(NSString *)message viewController:(UIViewController *)viewController {
    
    [self stopIndicatorInViewController:viewController];
    [self showIndicatorDialogWithMessage:message delegate:viewController view:viewController.view];
    
}

-(void)showIndicatorDialogWithMessage:(NSString *)message viewController:(UIViewController *)viewController duration:(NSTimeInterval)duration {
    
    [self stopIndicatorInViewController:viewController];
    [self showIndicatorDialogWithMessage:message delegate:viewController view:viewController.view duration:duration];
    
}

-(void)showIndicatorDialogWithMessage:(NSString *)message delegate:(id)delegate view:(UIView *)view {
    
    [self showIndicatorDialogWithMessage:message delegate:delegate view:view duration:1.0];
    
}

-(void)showIndicatorDialogWithMessage:(NSString *)message delegate:(id)delegate view:(UIView *)view duration:(NSTimeInterval)duration {
    
    [self stopIndicatorInView:view];
    
    HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkmark"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    [[delegate class] conformsToProtocol:@protocol(MBProgressHUDDelegate)];
    
    HUD.delegate = delegate;
    HUD.label.text = message;
    
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:duration];
    
}

-(void)stopIndicatorInView:(UIView *)view {
    
    view.userInteractionEnabled = YES;
    [self stopIndicator];
    
}

-(void)stopIndicatorInViewController:(UIViewController *)viewController {
    
    viewController.navigationController.toolbar.userInteractionEnabled = YES;
    
    [self stopIndicator];
    
}

-(void)stopIndicatorWithDelay:(CGFloat)delay viewController:(UIViewController *)viewController {
    
    [self performSelector:@selector(stopIndicatorInViewController:) withObject:viewController afterDelay:delay];
    
}

-(void)stopIndicatorWithDelay:(CGFloat)delay view:(UIView *)view {
    
    [self performSelector:@selector(stopIndicatorInView:) withObject:view afterDelay:delay];
    
}

-(void)stopIndicator {
    
    [HUD hideAnimated:YES];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

-(void)showSuccessWithStatus:(NSString *)status viewController:(UIViewController *)viewController {
    
    [self showSuccessWithStatus:status viewController:viewController duration:1.0];
    
}

-(void)showSuccessWithStatus:(NSString *)status viewController:(UIViewController *)viewController duration:(NSTimeInterval)duration {
    
    [self showIndicatorDialogWithMessage:status viewController:viewController duration:duration];
    
}

@end
