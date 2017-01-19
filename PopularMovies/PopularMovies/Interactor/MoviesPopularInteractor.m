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
        
        // Failure
        
    }];
    
}

@end
