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

@property (nonatomic, readonly) MovieModel *movie;

@property (nonatomic, readonly) NSString *titleText;
@property (nonatomic, readonly) NSString *yearText;
@property (nonatomic, readonly) NSString *overviewText;
@property (nonatomic, readonly) UIImage *pictureImage;

@end
