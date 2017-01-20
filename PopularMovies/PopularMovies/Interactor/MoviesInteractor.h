//
//  MoviesInteractor.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "HandleErrorDelegate.h"
#import "ListElementsDelegate.h"
#import "LoadingDelegate.h"

@class MovieModel;

@interface MoviesInteractor : NSObject

@property(strong,nonatomic) NSMutableArray<MovieModel *> *movies;
@property(nonatomic) BOOL needsLoadMore;
@property(nonatomic,strong) NSNumber *page;

@property(weak,nonatomic) id<HandleErrorDelegate> delegateHandleError;
@property(weak,nonatomic) id<ListElementsDelegate> delegateListElements;
@property(weak,nonatomic) id<LoadingDelegate> delegateLoading;

-(MovieModel *)movieAtIndexPath:(NSIndexPath *)indexPath;

-(NSInteger)numberOfRows;

-(void)didLoadMovies:(NSArray<MovieModel *> *)movies page:(NSNumber *)page;

// HandleErrorDelegate facilities
-(void)handleError:(NSError *)error;

// ListElementsDelegate facilities
-(void)reloadList;

// LoadingDelegate facilities
-(void)startLoading;
-(void)stopLoading;

@end
