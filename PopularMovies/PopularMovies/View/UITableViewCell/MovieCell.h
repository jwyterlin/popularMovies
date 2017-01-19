//
//  MovieCell.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "GenericCell.h"

@class MoviePresenter;

@interface MovieCell : GenericCell

+(MovieCell *)cellAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView moviePresenter:(MoviePresenter *)moviePresenter;

@end
