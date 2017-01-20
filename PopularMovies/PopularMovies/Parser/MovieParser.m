//
//  MovieParser.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MovieParser.h"

// Model
#import "MovieModel.h"

// Utils
#import "Validator.h"

@implementation MovieParser

-(MovieModel *)movieWithJson:(NSDictionary *)json {
    
    if ( ! [Validator validateObject:json] )
        return nil;
    
    NSString *title = json[@"title"];
    NSNumber *year = [NSNumber numberWithInteger:[json[@"year"] integerValue]];
    NSString *overview = json[@"overview"];
    
    return [[MovieModel alloc] initWithTitle:title year:year overview:overview picture:nil];
    
}

-(NSArray<MovieModel *> *)moviesWithJsonArray:(NSArray *)jsonArray {
    
    if ( ! [Validator validateObject:jsonArray] )
        return nil;
    
    NSMutableArray *mutableArray = [NSMutableArray new];
    
    for ( NSDictionary *json in jsonArray ) {
        
        MovieModel *movieModel = [self movieWithJson:json];
        
        if ( movieModel ) {
            [mutableArray addObject:movieModel];
        }
        
    }
    
    return mutableArray;
    
}

@end
