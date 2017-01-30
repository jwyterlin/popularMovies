//
//  MoviesViewController.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 18/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesViewController.h"

// Interactor
#import "MoviesPopularInteractor.h"
#import "MoviesSearchedInteractor.h"

// Model
#import "MovieModel.h"

// Presenter
#import "MoviePresenter.h"

// View - UITableViewCell
#import "LoadingMoreCell.h"
#import "MovieCell.h"

// Utils
#import "Indicator.h"

// Category
#import "UITableView+Helper.h"

@interface MoviesViewController()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchResultsUpdating,LoadingDelegate,ListElementsDelegate,HandleErrorDelegate>

@property(weak,nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) UISearchController *searchController;

// Interactors
@property(strong,nonatomic) MoviesPopularInteractor *moviesPopularInteractor;
@property(strong,nonatomic) MoviesSearchedInteractor *moviesSearchedInteractor;

@property(nonatomic,strong) NSTimer *timer;

@end

@implementation MoviesViewController

#pragma mark - ViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"Popular Movies";
    
    [self setupTableView];
    [self setupSearchController];
    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self.moviesPopularInteractor loadMoviesPopular];
    
}

-(void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    MoviesInteractor *moviesInteractor = [self currentMoviesInteractor];
    
    NSInteger numberOfRows = [moviesInteractor numberOfRows];
    
    return numberOfRows;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MoviesInteractor *moviesInteractor = [self currentMoviesInteractor];
    
    NSInteger numberOfRows = [moviesInteractor numberOfRows];
    BOOL needsLoadMore = [moviesInteractor needsLoadMore];
    
    if ( indexPath.row == numberOfRows - 1 && needsLoadMore ) {
        
        return [LoadingMoreCell cellWithTableView:tableView text:@"Loading more..." completion:^{
            
            if ( [self searchIsActive] ) {
                [self.moviesSearchedInteractor searchMoviesByTerm:self.searchController.searchBar.text];
            } else {
                [self.moviesPopularInteractor loadMoviesPopular];
            }
                                           
        }];
        
    }
    
    MovieModel *movieModel = [moviesInteractor movieAtIndexPath:indexPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    
    return [MovieCell cellAtIndexPath:indexPath tableView:tableView moviePresenter:moviePresenter];
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchController.searchBar resignFirstResponder];
}

#pragma mark - UISearchBarDelegate

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    // User touched the Cancel button
    [self.moviesSearchedInteractor cancelSearch];
    
}

#pragma mark - UISearchResultsUpdating

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *keyword = searchController.searchBar.text;
    
    [self willSearchKeyword:keyword];
    
}

#pragma mark - Timer to Search

-(void)willSearchKeyword:(NSString *)keyword {
    
    // It schedules to begin the search 1 second after user stops typing
    if ( keyword ) {
        if ( ! [keyword isEqualToString:@""] ) {
            // Cancel old search
            [self.moviesSearchedInteractor cancelSearch];
            [self.timer invalidate];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scheduleSearch:) userInfo:nil repeats:NO];
        }
    }
    
}

-(void)scheduleSearch:(NSTimer *)timer {
    
    // Search by term
    [self.moviesSearchedInteractor searchMoviesByTerm:self.searchController.searchBar.text];
    
}

#pragma mark - LoadingDelegate

-(void)loadingDelegate_startLoading {
    [[Indicator shared] showIndicatorWithViewController:self];
}

-(void)loadingDelegate_stopLoading {
    [[Indicator shared] stopIndicatorInViewController:self];
}

#pragma mark - ListElementsDelegate

-(void)listElementsDelegate_reloadList {
    [self.tableView reloadData];
}

#pragma mark - HandleErrorDelegate

-(void)handleErrorDelegate_handleError:(nonnull NSError *)error {
}

#pragma mark - Setup SearchController

-(void)setupSearchController {
    
    self.definesPresentationContext = YES;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.tableView reloadData];
    
}

#pragma mark - Setup tableView

-(void)setupTableView {
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = [MovieCell heightForCell];
    
    NSString *identifier = [MovieCell identifier];
    [self.tableView registerNibForCellReuseIdentifier:identifier];
    
}

#pragma mark - Search Helper methods

-(BOOL)searchIsActive {
    
    BOOL searchIsActive = ( self.searchController.active && ! [self.searchController.searchBar.text isEqualToString:@""] );
    
    return searchIsActive;
    
}

-(MoviesInteractor *)currentMoviesInteractor {
    
    MoviesInteractor *moviesInteractor;
    
    if ( [self searchIsActive] )
        moviesInteractor = self.moviesSearchedInteractor;
    else
        moviesInteractor = self.moviesPopularInteractor;
    
    return moviesInteractor;
    
}

#pragma mark - Lazy Instances

-(UISearchController *)searchController {
    
    if ( ! _searchController ) {
        
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.searchBar.delegate = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        [_searchController.searchBar sizeToFit];
        
    }
    
    return _searchController;
    
}

-(MoviesPopularInteractor *)moviesPopularInteractor {
    
    if ( ! _moviesPopularInteractor ) {
        
        _moviesPopularInteractor = [MoviesPopularInteractor new];
        _moviesPopularInteractor.delegateLoading = self;
        _moviesPopularInteractor.delegateListElements = self;
        _moviesPopularInteractor.delegateHandleError = self;
        
    }
    
    return _moviesPopularInteractor;
    
}

-(MoviesSearchedInteractor *)moviesSearchedInteractor {
    
    if ( ! _moviesSearchedInteractor ) {
        
        _moviesSearchedInteractor = [MoviesSearchedInteractor new];
        _moviesSearchedInteractor.delegateLoading = self;
        _moviesSearchedInteractor.delegateListElements = self;
        _moviesSearchedInteractor.delegateHandleError = self;
        
    }
    
    return _moviesSearchedInteractor;
    
}

@end
