//
//  MoviePresenterTests.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Expecta.h"
#import <Specta/Specta.h>

// Model
#import "MovieModel.h"

// Presenter
#import "MoviePresenter.h"

SpecBegin(MoviePresenter)

NSString *title = @"Lorem Ipsum";
NSDate *releaseDate = [NSDate date];
NSString *overview = @"Curabitur molestie dolor ut sapien dictum gravida. Fusce erat leo, volutpat vel pharetra vitae, semper in sem. Proin nunc erat, dapibus ac odio sit amet, accumsan laoreet dui. In molestie erat et tellus condimentum pellentesque. Nulla risus metus, aliquam non orci sit amet, feugiat vestibulum nisi. Curabitur lorem ex, finibus sed erat nec, aliquam elementum lectus. Duis iaculis, nisi aliquam efficitur faucibus, ex lacus congue justo, in scelerisque sem nisi vitae justo. Integer id dui blandit, tincidunt enim nec, auctor eros. Donec placerat nec mauris id vehicula. Proin at efficitur ante. Suspendisse lorem arcu, pellentesque auctor tempor ac, accumsan vitae lacus. Integer vel felis eget arcu pulvinar efficitur vel quis justo. Nulla quis consectetur enim. Nulla pellentesque nulla id interdum sollicitudin.";
NSString *posterPath = @"/WLQN5aiQG8wc9SeKwixW7pAR8K.jpg";

it (@"should use the title available. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:title releaseDate:releaseDate overview:overview posterPath:posterPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    expect( moviePresenter.titleText ).to.equal(@"Lorem Ipsum");
    
});

it (@"should not use an unavailable title. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:nil releaseDate:releaseDate overview:overview posterPath:posterPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    expect( moviePresenter.titleText ).to.equal(@"No title");
    
});

it (@"should have title with year between parentheses. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:title releaseDate:releaseDate overview:overview posterPath:posterPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    expect( moviePresenter.titleYearText ).to.equal(@"Lorem Ipsum (2017)");
    
});

it (@"should have correct overview. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:title releaseDate:releaseDate overview:overview posterPath:posterPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    expect( moviePresenter.overviewText ).to.equal(@"Curabitur molestie dolor ut sapien dictum gravida. Fusce erat leo, volutpat vel pharetra vitae, semper in sem. Proin nunc erat, dapibus ac odio sit amet, accumsan laoreet dui. In molestie erat et tellus condimentum pellentesque. Nulla risus metus, aliquam non orci sit amet, feugiat vestibulum nisi. Curabitur lorem ex, finibus sed erat nec, aliquam elementum lectus. Duis iaculis, nisi aliquam efficitur faucibus, ex lacus congue justo, in scelerisque sem nisi vitae justo. Integer id dui blandit, tincidunt enim nec, auctor eros. Donec placerat nec mauris id vehicula. Proin at efficitur ante. Suspendisse lorem arcu, pellentesque auctor tempor ac, accumsan vitae lacus. Integer vel felis eget arcu pulvinar efficitur vel quis justo. Nulla quis consectetur enim. Nulla pellentesque nulla id interdum sollicitudin.");
    
});

it (@"should not have overview. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:title releaseDate:releaseDate overview:nil posterPath:posterPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    expect( moviePresenter.overviewText ).to.beNil;
    
});

it (@"should have correct overview without set overviewText again. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:title releaseDate:releaseDate overview:overview posterPath:posterPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    
    [moviePresenter overviewText];
    
    expect( moviePresenter.overviewText ).to.equal(@"Curabitur molestie dolor ut sapien dictum gravida. Fusce erat leo, volutpat vel pharetra vitae, semper in sem. Proin nunc erat, dapibus ac odio sit amet, accumsan laoreet dui. In molestie erat et tellus condimentum pellentesque. Nulla risus metus, aliquam non orci sit amet, feugiat vestibulum nisi. Curabitur lorem ex, finibus sed erat nec, aliquam elementum lectus. Duis iaculis, nisi aliquam efficitur faucibus, ex lacus congue justo, in scelerisque sem nisi vitae justo. Integer id dui blandit, tincidunt enim nec, auctor eros. Donec placerat nec mauris id vehicula. Proin at efficitur ante. Suspendisse lorem arcu, pellentesque auctor tempor ac, accumsan vitae lacus. Integer vel felis eget arcu pulvinar efficitur vel quis justo. Nulla quis consectetur enim. Nulla pellentesque nulla id interdum sollicitudin.");
    
});

SpecEnd
