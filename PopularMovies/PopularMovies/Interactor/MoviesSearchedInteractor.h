//
//  MoviesSearchedInteractor.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesInteractor.h"

@interface MoviesSearchedInteractor : MoviesInteractor

-(void)searchMoviesByTerm:(NSString *)term;

-(void)cancelSearch;

-(void)clearList;

@end
