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
#import "Routes.h"
#import "Validator.h"

// Category
#import "NSDate+Helper.h"

@implementation MovieParser

-(MovieModel *)movieWithJson:(NSDictionary *)json {
    
    if ( ! [Validator validateObject:json] )
        return nil;
    
    // title
    NSString *title = json[@"title"];
    
    // releaseDate
    NSDate *releaseDate = [NSDate dateFromDefaultString:json[@"release_date"]];
    
    // overview
    NSString *overview = json[@"overview"];
    
    // poster_path
    NSString *posterPath = [NSString stringWithFormat:@"%@%@",[Routes BASE_IMAGE_URL],json[@"poster_path"]];
    
    return [[MovieModel alloc] initWithTitle:title releaseDate:releaseDate overview:overview posterPath:posterPath];
    
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
