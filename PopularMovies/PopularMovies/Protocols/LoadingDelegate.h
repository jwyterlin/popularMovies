//
//  LoadingDelegate.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoadingDelegate <NSObject>

-(void)loadingDelegate_startLoading;
-(void)loadingDelegate_stopLoading;

@end
