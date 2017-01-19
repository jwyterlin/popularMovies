//
//  MoviePresenter.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@class MovieModel;

@interface MoviePresenter : NSObject

-(instancetype)initWithMovie:(MovieModel *)movie;

-(NSString *)titleText;
-(NSString *)yearText;
-(NSString *)overviewText;
-(UIImage *)pictureImage;
-(NSString *)titleYearText;

@end
