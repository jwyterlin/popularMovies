//
//  Indicator.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIViewController.h>

@interface Indicator : NSObject

+(instancetype)shared;

-(void)showIndicatorWithViewController:(UIViewController *)viewController;

-(void)showIndicatorWithLabel:(NSString *)label
               viewController:(UIViewController *)viewController;

-(void)showIndicatorWithLabel:(NSString *)label
                     delegate:(id)delegate
                         view:(UIView *)view;

-(void)showIndicatorDialogWithMessage:(NSString *)message
                       viewController:(UIViewController *)viewController;

-(void)showIndicatorDialogWithMessage:(NSString *)message
                       viewController:(UIViewController *)viewController
                             duration:(NSTimeInterval)duration;

-(void)showIndicatorDialogWithMessage:(NSString *)message
                             delegate:(id)delegate
                                 view:(UIView *)view;

-(void)showIndicatorDialogWithMessage:(NSString *)message
                             delegate:(id)delegate
                                 view:(UIView *)view
                             duration:(NSTimeInterval)duration;

-(void)stopIndicatorInView:(UIView *)view;

-(void)stopIndicatorInViewController:(UIViewController *)viewController;

-(void)stopIndicatorWithDelay:(CGFloat)delay viewController:(UIViewController *)viewController;

-(void)stopIndicatorWithDelay:(CGFloat)delay view:(UIView *)view;

-(void)showSuccessWithStatus:(NSString *)status
              viewController:(UIViewController *)viewController;

-(void)showSuccessWithStatus:(NSString *)status
              viewController:(UIViewController *)viewController
                    duration:(NSTimeInterval)duration;

@end
