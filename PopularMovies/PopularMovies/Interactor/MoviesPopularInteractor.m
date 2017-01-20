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

#pragma mark - HandleErrorDelegate facilities

-(void)handleError:(NSError *)error {
    
    if ( self.delegateHandleError )
        [self.delegateHandleError handleErrorDelegate_handleError:error];
    
}

#pragma mark - ListElementsDelegate facilities

-(void)reloadList {
    
    if ( self.delegateListElements )
        [self.delegateListElements listElementsDelegate_reloadList];
    
}

#pragma mark - LoadingDelegate facilities

-(void)startLoading {
    
    if ( self.delegateLoading )
        [self.delegateLoading loadingDelegate_startLoading];
    
}

-(void)stopLoading {
    
    if ( self.delegateLoading )
        [self.delegateLoading loadingDelegate_stopLoading];
    
}

@end
