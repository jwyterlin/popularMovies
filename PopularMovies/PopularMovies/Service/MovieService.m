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
    
    // Mock
    if ( success ) {
        success( [self moviesMock] );
    }
    return;
    
//    NSString *url = @"";
//    
//    NSDictionary *parameters = @{@"key":@"value"};
//    
//    [[Connection new] connectWithMethod:RequestMethodGet url:url parameters:parameters success:^(id responseData) {
//        
//        NSArray *result = (NSArray *)responseData;
//        
//        if ( result.count == 0 ) {
//            if ( success ) {
//                success( nil );
//            }
//            return;
//        }
//        
//        NSArray<MovieModel *> *movies = [[MovieParser new] moviesWithJsonArray:result];
//        
//        if ( success )
//            success( movies );
//        
//    } failure:^(BOOL hasNoConnection, NSError *error) {
//        
//        if ( failure )
//            failure( hasNoConnection, error );
//        
//    }];

    
}

-(NSArray<MovieModel *> *)moviesMock {
    
    MovieModel *movie1 = [[MovieModel alloc] initWithTitle:@"The Lord of the Rings: The Fellowship of the Ring" year:@2001 overview:@"A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron." posterPath:nil];
    MovieModel *movie2 = [[MovieModel alloc] initWithTitle:@"The Matrix" year:@1999 overview:@"A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers." posterPath:nil];
    MovieModel *movie3 = [[MovieModel alloc] initWithTitle:@"Guardians of the Galaxy" year:@2014 overview:@"A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe." posterPath:nil];
    MovieModel *movie4 = [[MovieModel alloc] initWithTitle:@"Filme" year:@2014 overview:@"Sinopse." posterPath:nil];
    
    NSArray *movies = @[movie1,movie2,movie3,movie4];
    
    return movies;
    
}

@end
