//
//  MoviesInteractor.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieModel;

@interface MoviesInteractor : NSObject

@property(strong,nonatomic) NSMutableArray<MovieModel *> *movies;

-(MovieModel *)movieAtIndexPath:(NSIndexPath *)indexPath;

-(NSInteger)numberOfRows;

@end
