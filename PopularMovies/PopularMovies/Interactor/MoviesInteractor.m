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

@end
