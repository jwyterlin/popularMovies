//
//  MoviesInteractor.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesInteractor.h"

#import <UIKit/UITableView.h>

// Model
#import "MovieModel.h"

@implementation MoviesInteractor

-(MovieModel *)movieAtIndexPath:(NSIndexPath *)indexPath {
    
    if ( self.movies.count > indexPath.row )
        return self.movies[indexPath.row];
    
    return nil;
    
}

-(NSInteger)numberOfRows {
    return self.movies.count;
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

#pragma mark - Lazy Instances

-(NSMutableArray<MovieModel *> *)movies {
    
    if ( ! _movies )
        _movies = [NSMutableArray new];
    return _movies;
    
}

@end
