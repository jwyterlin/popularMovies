//
//  MovieModel.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

-(instancetype)initWithTitle:(NSString *)title year:(NSNumber *)year overview:(NSString *)overview picture:(NSData *)picture;

@property(nonatomic,readonly) NSString *title;
@property(nonatomic,readonly) NSNumber *year;
@property(nonatomic,readonly) NSString *overview;
@property(nonatomic,readonly) NSData *picture;

@end
