//
//  MovieCell.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MovieCell.h"

// Presenter
#import "MoviePresenter.h"

@interface MovieCell()

@property(weak,nonatomic) IBOutlet UIImageView *moviePicture;
@property(weak,nonatomic) IBOutlet UILabel *movieTitleYear;
@property(weak,nonatomic) IBOutlet UILabel *movieOverview;

@end

@implementation MovieCell

#pragma mark - Overriding super methods

+(CGFloat)heightForCell {
    return 137.0f;
}

#pragma mark - Public methods

+(MovieCell *)cellAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView moviePresenter:(MoviePresenter *)moviePresenter {
    
    NSString *identifier = NSStringFromClass([MovieCell class]);
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    [self configureCell:cell moviePresenter:moviePresenter];
    
    return cell;
    
}

#pragma mark - Private methods

+(void)configureCell:(MovieCell *)cell moviePresenter:(MoviePresenter *)moviePresenter {
    
    cell.moviePicture.image = moviePresenter.pictureImage;
    
    cell.movieTitleYear.text = moviePresenter.titleYearText;
    
    cell.movieOverview.text = moviePresenter.overviewText;
    
}

@end
