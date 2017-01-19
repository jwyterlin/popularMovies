//
//  MoviePresenter.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviePresenter.h"

// Model
#import "MovieModel.h"

@implementation MoviePresenter

-(instancetype)initWithMovie:(MovieModel *)movie {
    
    self = [super init];
    
    if ( self ) {
        
        _movie = movie;
        
        if ( self.movie.title ) {
            _titleText = self.movie.title;
        } else {
            _titleText = @"No title";
        }
        
        _yearText = [self.movie.year stringValue];
        _overviewText = self.movie.overview;
        _pictureImage = [UIImage imageWithData:self.movie.picture];
        
    }
    
    return self;
    
}

@end
