//
//  LoadingMoreCellTests.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Expecta.h"
#import <Specta/Specta.h>

// View
#import "LoadingMoreCell.h"

SpecBegin(LoadingMoreCell)

UITableView *tableView = [UITableView new];

it (@"should have one subview. ", ^{
    
    UITableViewCell *cell = [LoadingMoreCell cellWithTableView:tableView text:@"Loading more..." completion:^{
    }];
    
    NSInteger numberOfSubviews = cell.subviews.count;
    
    expect( numberOfSubviews ).to.equal(1);
    
});

SpecEnd
