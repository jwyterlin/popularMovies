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

// Model
#import "MovieModel.h"

@implementation MoviesPopularInteractor

#pragma mark - Public methods

-(void)loadMoviesPopular {
    
    [self startLoading];
    
    [[MovieService new] moviesPopularWithPage:self.page success:^(NSArray<MovieModel *> *movies) {
        
        [self stopLoading];
        
        [self didLoadMovies:movies page:self.page];
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        [self stopLoading];
        
        [self handleError:error];
        
    }];
    
}

@end
