//
//  MoviesPopularInteractor.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesInteractor.h"

// Protocols
#import "HandleErrorDelegate.h"
#import "ListElementsDelegate.h"

@interface MoviesPopularInteractor : MoviesInteractor

@property(weak,nonatomic) id<HandleErrorDelegate> delegateHandleError;
@property(weak,nonatomic) id<ListElementsDelegate> delegateListElements;

@end
