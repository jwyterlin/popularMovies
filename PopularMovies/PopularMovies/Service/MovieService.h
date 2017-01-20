//
//  MovieService.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "GenericService.h"

@class MovieModel;

@interface MovieService : GenericService

-(void)moviesPopularWithPage:(NSNumber *)page
                     success:(void(^)(NSArray<MovieModel *> *movies))success
                     failure:(void(^)(BOOL hasNoConnection, NSError *error))failure;

-(void)searchMoviesByTerm:(NSString *)term
                     page:(NSNumber *)page
                  success:(void(^)(NSArray<MovieModel *> *movies))success
                  failure:(void(^)(BOOL hasNoConnection, NSError *error))failure;

@end
