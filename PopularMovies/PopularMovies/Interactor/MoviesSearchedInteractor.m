//
//  MoviesSearchedInteractor.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesSearchedInteractor.h"

// Service
#import "MovieService.h"

// Utils
#import "NetAPIClient.h"

@implementation MoviesSearchedInteractor

#pragma mark - Public methods

-(void)searchMoviesByTerm:(NSString *)term {
    
    [self startLoading];
    
    [[MovieService new] searchMoviesByTerm:term page:self.page success:^(NSArray<MovieModel *> *movies) {
        
        [self stopLoading];
        
        [self didLoadMovies:movies page:self.page];
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        [self stopLoading];
        
        [self handleError:error];
        
    }];
    
}

-(void)cancelSearch {
    
    [self stopLoading];
    
    self.page = @1;
    
    [[NetAPIClient sharedClient] cancelAllOperations];
    
}

-(void)clearList {
 
    [self.movies removeAllObjects];
    
    [self reloadList];
    
}

@end
