//
//  MovieModelTests.m
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

SpecBegin(MovieModel)

NSString *title = @"Lorem Ipsum";
NSDate *releaseDate = [NSDate date];
NSString *overview = @"Curabitur molestie dolor ut sapien dictum gravida. Fusce erat leo, volutpat vel pharetra vitae, semper in sem. Proin nunc erat, dapibus ac odio sit amet, accumsan laoreet dui. In molestie erat et tellus condimentum pellentesque. Nulla risus metus, aliquam non orci sit amet, feugiat vestibulum nisi. Curabitur lorem ex, finibus sed erat nec, aliquam elementum lectus. Duis iaculis, nisi aliquam efficitur faucibus, ex lacus congue justo, in scelerisque sem nisi vitae justo. Integer id dui blandit, tincidunt enim nec, auctor eros. Donec placerat nec mauris id vehicula. Proin at efficitur ante. Suspendisse lorem arcu, pellentesque auctor tempor ac, accumsan vitae lacus. Integer vel felis eget arcu pulvinar efficitur vel quis justo. Nulla quis consectetur enim. Nulla pellentesque nulla id interdum sollicitudin.";
NSString *posterPath = @"/WLQN5aiQG8wc9SeKwixW7pAR8K.jpg";

it (@"should use the title available. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:title releaseDate:releaseDate overview:overview posterPath:posterPath];
    expect( movieModel.title ).to.equal(@"Lorem Ipsum");
    
});

it (@"should be title nil. ", ^{
    
    MovieModel *movieModel = [[MovieModel alloc] initWithTitle:nil releaseDate:releaseDate overview:overview posterPath:posterPath];
    expect( movieModel.title ).to.equal(nil);
    
});

SpecEnd
