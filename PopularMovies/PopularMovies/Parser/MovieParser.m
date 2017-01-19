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

@implementation MovieParser

-(MovieModel *)movieWithJson:(NSDictionary *)json {
    
    return [MovieModel new];
    
}

@end
