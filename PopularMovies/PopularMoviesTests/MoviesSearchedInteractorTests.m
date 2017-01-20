//
//  MoviesSearchedInteractorTests.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Expecta.h"
#import <Specta/Specta.h>

// Interactor
#import "MoviesSearchedInteractor.h"

// Model
#import "MovieModel.h"

SpecBegin(MoviesSearchedInteractor)

NSDate *date = [NSDate date];

MovieModel *movie1 = [[MovieModel alloc] initWithTitle:@"The Lord of the Rings: The Fellowship of the Ring"
                                           releaseDate:date
                                              overview:@"A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron."
                                            posterPath:nil];

MovieModel *movie2 = [[MovieModel alloc] initWithTitle:@"The Matrix"
                                           releaseDate:date
                                              overview:@"A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers."
                                            posterPath:nil];

MovieModel *movie3 = [[MovieModel alloc] initWithTitle:@"Guardians of the Galaxy"
                                           releaseDate:date
                                              overview:@"A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe."
                                            posterPath:nil];

NSMutableArray<MovieModel *> *movies = (NSMutableArray<MovieModel *> *)[[NSMutableArray alloc] initWithArray:@[movie1,movie2,movie3]];

it (@"should have correct title. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    moviesSearchedInteractor.movies = movies;
    
    MovieModel *movie = [moviesSearchedInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.title ).to.equal(@"The Lord of the Rings: The Fellowship of the Ring");
    
});

it (@"should have correct year. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    moviesSearchedInteractor.movies = movies;
    
    MovieModel *movie = [moviesSearchedInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.releaseDate ).to.equal(date);
    
});

it (@"should have correct overview. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    moviesSearchedInteractor.movies = movies;
    
    MovieModel *movie = [moviesSearchedInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.overview ).to.equal(@"A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron.");
    
});

it (@"should have the correct number of movies. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    moviesSearchedInteractor.movies = movies;
    
    NSInteger numberOfMovies = [moviesSearchedInteractor numberOfRows];
    
    expect( numberOfMovies ).to.equal( 3 );
    
});

it (@"should have correct movie. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    moviesSearchedInteractor.movies = movies;
    
    MovieModel *movie = [moviesSearchedInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    expect( movie.title ).to.equal(@"The Lord of the Rings: The Fellowship of the Ring");
    expect( movie.releaseDate ).to.equal(date);
    expect( movie.overview ).to.equal(@"A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron.");
    
});

it (@"should have nil movie. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    moviesSearchedInteractor.movies = movies;
    
    MovieModel *movie = [moviesSearchedInteractor movieAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    
    expect( movie ).to.beNil;
    
});

it (@"should get movies searching by term. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    [moviesSearchedInteractor searchMoviesByTerm:@"Star wars"];
    
    // TODO: How to test it?
//    expect( movie ).to.beNil;
    
});

it (@"should cancel search. ", ^{
    
    MoviesSearchedInteractor *moviesSearchedInteractor = [MoviesSearchedInteractor new];
    [moviesSearchedInteractor cancelSearch];
    
    // TODO: How to test it?
    //    expect( movie ).to.beNil;
    
});

SpecEnd
