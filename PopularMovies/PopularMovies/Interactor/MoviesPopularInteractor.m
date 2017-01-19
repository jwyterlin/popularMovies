//
//  MoviesPopularInteractor.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesPopularInteractor.h"

// Service
#import "MovieService.h"

@implementation MoviesPopularInteractor

-(void)loadMoviesPopularWithPage:(NSNumber *)page {
    
    [[MovieService new] moviesPopularWithPage:page success:^(MovieModel *movie) {
        
        // Success
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        [self handleError:error];
        
    }];
    
}

#pragma mark - HandleErrorDelegate facilities

-(void)handleError:(NSError *)error {
    
    if ( self.delegateHandleError )
        [self.delegateHandleError handleErrorDelegate_handleError:error];
    
}

@end
