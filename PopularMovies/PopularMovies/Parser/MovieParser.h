//
//  MovieParser.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieModel;

@interface MovieParser : NSObject

-(MovieModel *)movieWithJson:(NSDictionary *)json;

-(NSArray<MovieModel *> *)moviesWithJsonArray:(NSArray *)jsonArray;

@end
