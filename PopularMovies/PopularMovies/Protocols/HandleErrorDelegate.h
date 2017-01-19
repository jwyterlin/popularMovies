//
//  HandleErrorDelegate.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HandleErrorDelegate <NSObject>

-(void)handleErrorDelegate_handleError:(nonnull NSError *)error;

@end
