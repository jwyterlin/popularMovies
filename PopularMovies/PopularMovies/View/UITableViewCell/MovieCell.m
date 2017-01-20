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

// Category
#import "UIImageView+Helper.h"

@interface MovieCell()

@property(weak,nonatomic) IBOutlet UIImageView *moviePicture;
@property(weak,nonatomic) IBOutlet UILabel *movieTitleYear;
@property(weak,nonatomic) IBOutlet UILabel *movieOverview;

@end

@implementation MovieCell

#pragma mark - Overriding super methods

+(CGFloat)heightForCell {
    return 195.0f;
}

+(NSString *)identifier {
    return NSStringFromClass( [MovieCell class] );
}

#pragma mark - Public methods

+(MovieCell *)cellAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView moviePresenter:(MoviePresenter *)moviePresenter {
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    
    [self configureCell:cell moviePresenter:moviePresenter];
    
    return cell;
    
}

#pragma mark - Private methods

+(void)configureCell:(MovieCell *)cell moviePresenter:(MoviePresenter *)moviePresenter {
    
    [cell configureMoviePictureWithMoviePresenter:moviePresenter];
    
    cell.movieTitleYear.text = moviePresenter.titleYearText;
    
    cell.movieOverview.text = moviePresenter.overviewText;
    
}

-(void)configureMoviePictureWithMoviePresenter:(MoviePresenter *)moviePresenter {
    
    self.moviePicture.image = nil;
    
    if ( moviePresenter.pictureImage ) {
        
        self.moviePicture.image = moviePresenter.pictureImage;
        
    } else {
        
        __weak MovieCell *weakCell = self;
        __weak MoviePresenter *weakMoviePresenter = moviePresenter;
        
        [self.moviePicture downloadImageWithUrl:moviePresenter.posterPathText completion:^(UIImage *image) {
            
            weakCell.moviePicture.image = image;
            [weakMoviePresenter updatePictureImage:image];
            [weakCell setNeedsLayout];
            
        }];
        
    }
    
}

@end
