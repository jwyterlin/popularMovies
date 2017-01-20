//
//  MoviesInteractorTests.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Expecta.h"
#import <Specta/Specta.h>

// Interactor
#import "MoviesInteractor.h"

// Model
#import "MovieModel.h"

SpecBegin(MoviesInteractor)

MovieModel *movie1 = [[MovieModel alloc] initWithTitle:@"The Lord of the Rings: The Fellowship of the Ring" year:@2001 overview:@"A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron." posterPath:nil];
MovieModel *movie2 = [[MovieModel alloc] initWithTitle:@"The Matrix" year:@1999 overview:@"A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers." posterPath:nil];
MovieModel *movie3 = [[MovieModel alloc] initWithTitle:@"Guardians of the Galaxy" year:@2014 overview:@"A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe." posterPath:nil];

NSMutableArray<MovieModel *> *movies = (NSMutableArray<MovieModel *> *)[[NSMutableArray alloc] initWithArray:@[movie1,movie2,movie3]];

it (@"should have correct title. ", ^{
    
    MoviesInteractor *moviesInteractor = [MoviesInteractor new];
    moviesInteractor.movies = movies;
    
    MovieModel *movie = [moviesInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.title ).to.equal(@"The Lord of the Rings: The Fellowship of the Ring");
    
});

it (@"should have correct year. ", ^{
    
    MoviesInteractor *moviesInteractor = [MoviesInteractor new];
    moviesInteractor.movies = movies;
    
    MovieModel *movie = [moviesInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.year ).to.equal(@2001);
    
});

it (@"should have correct overview. ", ^{
    
    MoviesInteractor *moviesInteractor = [MoviesInteractor new];
    moviesInteractor.movies = movies;
    
    MovieModel *movie = [moviesInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.overview ).to.equal(@"A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron.");
    
});

it (@"should have the correct number of movies. ", ^{
    
    MoviesInteractor *moviesInteractor = [MoviesInteractor new];
    moviesInteractor.movies = movies;
    
    NSInteger numberOfMovies = [moviesInteractor numberOfRows];
    
    expect( numberOfMovies ).to.equal( 3 );
    
});

it (@"should have correct movie. ", ^{
    
    MoviesInteractor *moviesInteractor = [MoviesInteractor new];
    moviesInteractor.movies = movies;
    
    MovieModel *movie = [moviesInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.title ).to.equal(@"The Lord of the Rings: The Fellowship of the Ring");
    expect( movie.year ).to.equal(@2001);
    expect( movie.overview ).to.equal(@"A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron.");
    
});

it (@"should have nil movie. ", ^{
    
    MoviesInteractor *moviesInteractor = [MoviesInteractor new];
    moviesInteractor.movies = movies;
    
    MovieModel *movie = [moviesInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    
    expect( movie ).to.beNil;
    
});

SpecEnd
