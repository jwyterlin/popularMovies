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

-(void)moviesPopularWithPage:(NSNumber *)page
                     success:(void(^)(NSArray<MovieModel *> *movies))success
                     failure:(void(^)(BOOL hasNoConnection, NSError *error))failure {
    
    NSString *url = @"";
    
    NSDictionary *parameters = @{@"key":@"value"};
    
    [[Connection new] connectWithMethod:RequestMethodGet url:url parameters:parameters success:^(id responseData) {
        
        NSArray *result = (NSArray *)responseData;
        
        if ( result.count == 0 ) {
            if ( success ) {
                success( nil );
            }
            return;
        }
        
        NSArray<MovieModel *> *movies = [[MovieParser new] moviesWithJsonArray:result];
        
        if ( success )
            success( movies );
        
    } failure:^(BOOL hasNoConnection, NSError *error) {
        
        if ( failure )
            failure( hasNoConnection, error );
        
    }];

    
}

@end
