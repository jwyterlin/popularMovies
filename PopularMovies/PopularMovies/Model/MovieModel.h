//
//  MovieModel.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface MovieModel : NSObject

-(instancetype)initWithTitle:(NSString *)title releaseDate:(NSDate *)releaseDate overview:(NSString *)overview posterPath:(NSString *)posterPath;

@property(nonatomic,readonly) NSString *title;
@property(nonatomic,readonly) NSDate *releaseDate;
@property(nonatomic,readonly) NSString *overview;
@property(nonatomic,readonly) NSString *posterPath;
@property(nonatomic,readonly) NSData *picture;

-(void)updatePicture:(NSData *)image;

@end
