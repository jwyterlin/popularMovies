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

// Category
#import "NSDate+Helper.h"

@interface MoviePresenter()

@property(nonatomic,readonly) MovieModel *movie;

@property(nonatomic,retain) NSString *titleText;
@property(nonatomic,retain) NSString *yearText;
@property(nonatomic,retain) NSString *overviewText;
@property(nonatomic,retain) UIImage *pictureImage;
@property(nonatomic,retain) NSString *titleYearText;
@property(nonatomic,retain) NSString *posterPathText;

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
    
    NSInteger year = [NSDate getYearFromDate:self.movie.releaseDate];
    
    if ( year == 0 ) {
        _yearText = @"N/A";
    } else {
        _yearText = [NSString stringWithFormat:@"%li",(long)year];
    }
    
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

-(NSString *)posterPathText {
    
    if ( _posterPathText )
        return _posterPathText;
    
    _posterPathText = self.movie.posterPath;
    
    return _posterPathText;
    
}

-(void)updatePictureImage:(UIImage *)image {
    
    _pictureImage = image;
    
    NSData *picture = UIImageJPEGRepresentation(image, 1.0);
    
    [self.movie updatePicture:picture];
    
    
}

@end
