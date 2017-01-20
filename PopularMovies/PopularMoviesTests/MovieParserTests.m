//
//  MovieParserTests.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Expecta.h"
#import <Specta/Specta.h>

// Parser
#import "MovieParser.h"

// Model
#import "MovieModel.h"

SpecBegin(MovieParser)

it (@"should movie be nil. ", ^{
    
    MovieParser *movieParser = [[MovieParser alloc] init];
    
    MovieModel *movieModel = [movieParser movieWithJson:nil];
    
    expect( movieModel ).to.beNil;
    
});

it (@"should have movie valid. ", ^{
    
    MovieParser *movieParser = [[MovieParser alloc] init];
    
    NSDictionary *json = @{@"title":@"The Lord of th Rings",
                           @"release_date":@"2001-06-18",
                           @"overview":@"Curabitur molestie dolor ut sapien dictum gravida. Fusce erat leo, volutpat vel pharetra vitae, semper in sem. Proin nunc erat, dapibus ac odio sit amet, accumsan laoreet dui. In molestie erat et tellus condimentum pellentesque. Nulla risus metus, aliquam non orci sit amet, feugiat vestibulum nisi. Curabitur lorem ex, finibus sed erat nec, aliquam elementum lectus. Duis iaculis, nisi aliquam efficitur faucibus, ex lacus congue justo, in scelerisque sem nisi vitae justo. Integer id dui blandit, tincidunt enim nec, auctor eros. Donec placerat nec mauris id vehicula. Proin at efficitur ante. Suspendisse lorem arcu, pellentesque auctor tempor ac, accumsan vitae lacus. Integer vel felis eget arcu pulvinar efficitur vel quis justo. Nulla quis consectetur enim. Nulla pellentesque nulla id interdum sollicitudin.",
                           @"poster_path":@"/WLQN5aiQG8wc9SeKwixW7pAR8K.jpg"
                           };
    
    MovieModel *movieModel = [movieParser movieWithJson:json];
    
    expect( movieModel ).to.beNil;
    
});

SpecEnd
