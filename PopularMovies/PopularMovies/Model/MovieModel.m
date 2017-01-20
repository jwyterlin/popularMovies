//
//  MovieModel.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

-(instancetype)initWithTitle:(NSString *)title year:(NSNumber *)year overview:(NSString *)overview posterPath:(NSString *)posterPath {
    
    self = [super init];
    
    if ( self ) {
        
        _title = title;
        _year = year;
        _overview = overview;
        _posterPath = posterPath;
        
    }
    
    return self;
    
}

@end
