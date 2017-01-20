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

SpecEnd
