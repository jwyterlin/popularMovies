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
    
    [self loadMoviesPopularWithPage:@1];
    
}

#pragma mark - Private methods

-(void)loadMoviesPopularWithPage:(NSNumber *)page {
    
    [self startLoading];
    
    [[MovieService new] moviesPopularWithPage:page success:^(NSArray<MovieModel *> *movies) {
        
        [self stopLoading];
        
        [self.movies addObjectsFromArray:movies];
        
        [self reloadList];
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        [self stopLoading];
        
        [self handleError:error];
        
    }];
    
}

@end
