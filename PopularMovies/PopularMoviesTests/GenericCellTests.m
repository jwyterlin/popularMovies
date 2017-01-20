//
//  GenericCellTests.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Expecta.h"
#import <Specta/Specta.h>

// View
#import "GenericCell.h"

SpecBegin(GenericCell)

it (@"should have correct height. ", ^{
    
    expect( [GenericCell heightForCell] ).to.equal(44.0f);
    
});

it (@"should have correct identifier. ", ^{
    
    expect( [GenericCell identifier] ).to.equal( @"GenericCell" );
    
});

SpecEnd
