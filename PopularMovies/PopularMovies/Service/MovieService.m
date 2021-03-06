//
//  MovieService.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MovieService.h"

// Model
#import "MovieModel.h"

// Parser
#import "MovieParser.h"

@implementation MovieService

#pragma mark - Public methods

-(void)moviesPopularWithPage:(NSNumber *)page
                     success:(void(^)(NSArray<MovieModel *> *movies))success
                     failure:(void(^)(BOOL hasNoConnection, NSError *error))failure {
    
    NSString *url = [Routes WS_MOVIE_POPULAR];
    
    NSDictionary *parameters = @{
                                 @"api_key":[Routes API_TOKEN],
                                 @"page":page
                                };
    
    [[Connection new] connectWithMethod:RequestMethodGet url:url parameters:parameters success:^(id responseData) {
        
        [self successWithResultMoviesList:responseData success:success];
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        if ( failure )
            failure( hasNoConnection, error );
        
    }];
    
}

-(void)searchMoviesByTerm:(NSString *)term
                     page:(NSNumber *)page
                  success:(void(^)(NSArray<MovieModel *> *movies))success
                  failure:(void(^)(BOOL hasNoConnection, NSError *error))failure {
    
    NSString *url = [Routes WS_SEARCH_MOVIE];
    
    term = [term stringByAddingPercentEncodingWithAllowedCharacters:[NSMutableCharacterSet alphanumericCharacterSet]];
    
    NSDictionary *parameters = @{
                                 @"api_key":[Routes API_TOKEN],
                                 @"query":term,
                                 @"page":page
                                 };
    
    [[Connection new] connectWithMethod:RequestMethodGet url:url parameters:parameters success:^(id responseData) {
        
        [self successWithResultMoviesList:responseData success:success];
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        if ( failure )
            failure( hasNoConnection, error );
        
    }];
    
}

#pragma mark - Private methods

-(void)successWithResultMoviesList:(id)responseData success:(void(^)(NSArray<MovieModel *> *movies))success {
    
    NSDictionary *result = (NSDictionary *)responseData;
    
    if ( result.count == 0 ) {
        if ( success ) {
            success( nil );
        }
        return;
    }
    
    if ( result[@"results"] ) {
        
        NSArray *results = result[@"results"];
        
        NSArray<MovieModel *> *movies = [[MovieParser new] moviesWithJsonArray:results];
        
        if ( success )
            success( movies );
        
        return;
        
    }
    
    if ( success ) {
        success( nil );
    }
    return;
    
}

@end
