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

@interface MoviePresenter()

@property(nonatomic,readonly) MovieModel *movie;

@property(nonatomic,retain) NSString *titleText;
@property(nonatomic,retain) NSString *yearText;
@property(nonatomic,retain) NSString *overviewText;
@property(nonatomic,retain) UIImage *pictureImage;
@property(nonatomic,retain) NSString *titleYearText;

@end

@implementation MoviePresenter

-(instancetype)initWithMovie:(MovieModel *)movie {
    
    self = [super init];
    
    if ( self ) {
        _movie = movie;
    }
    
    return self;
    
}

-(NSString *)titleText {
    
    if ( _titleText )
        return _titleText;
    
    if ( self.movie.title ) {
        _titleText = self.movie.title;
    } else {
        _titleText = @"No title";
    }
    
    return _titleText;
    
}

-(NSString *)yearText {
    
    if ( _yearText )
        return _yearText;
    
    _yearText = [self.movie.year stringValue];
    
    return _yearText;
    
}

-(NSString *)overviewText {
    
    if ( _overviewText )
        return _overviewText;
    
    _overviewText = self.movie.overview;
    
    return _overviewText;
    
}

-(UIImage *)pictureImage {
    
    if ( _pictureImage )
        return _pictureImage;
    
    _pictureImage = [UIImage imageWithData:self.movie.picture];
    
    return _pictureImage;
    
}

-(NSString *)titleYearText {
    
    if ( _titleYearText )
        return _titleYearText;
    
    _titleYearText = [NSString stringWithFormat:@"%@ (%@)", self.titleText, self.yearText];
    
    return _titleYearText;
    
}

@end
