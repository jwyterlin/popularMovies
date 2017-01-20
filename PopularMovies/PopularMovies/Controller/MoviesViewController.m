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

@interface MoviesViewController()<UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating,LoadingDelegate,ListElementsDelegate,HandleErrorDelegate>

@property(weak,nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) UISearchController *searchController;

// Interactors
@property(strong,nonatomic) MoviesPopularInteractor *moviesPopularInteractor;
@property(strong,nonatomic) MoviesSearchedInteractor *moviesSearchedInteractor;

@end

@implementation MoviesViewController

#pragma mark - ViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupTableView];
    
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
    
    NSInteger numberOfRows = [self.moviesPopularInteractor numberOfRows];
    
    return numberOfRows;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger numberOfRows = [self.moviesPopularInteractor numberOfRows];
    
    BOOL needsLoadMore = [self.moviesPopularInteractor needsLoadMore];
    
    if ( indexPath.row == numberOfRows - 1 && needsLoadMore ) {
        
        return [LoadingMoreCell cellWithTableView:tableView text:@"Loading more..." completion:^{
                                           
            [self.moviesPopularInteractor loadMoviesPopular];
                                           
        }];
        
    }
    
    MovieModel *movieModel = [self.moviesPopularInteractor movieAtIndexPath:indexPath];
    MoviePresenter *moviePresenter = [[MoviePresenter alloc] initWithMovie:movieModel];
    
    return [MovieCell cellAtIndexPath:indexPath tableView:tableView moviePresenter:moviePresenter];
    
}

#pragma mark - UISearchBarDelegate

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
}

#pragma mark - UISearchResultsUpdating

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
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
    
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.definesPresentationContext = YES;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
}

#pragma mark - Setup tableView

-(void)setupTableView {
    
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = [MovieCell heightForCell];
    
    NSString *identifier = [MovieCell identifier];
    [self.tableView registerNibForCellReuseIdentifier:identifier];
    
}

#pragma mark - Lazy Instances

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
        
    }
    
    return _moviesSearchedInteractor;
    
}

@end
