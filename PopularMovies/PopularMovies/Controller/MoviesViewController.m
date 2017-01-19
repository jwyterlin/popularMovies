//
//  MoviesViewController.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 18/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesViewController.h"

@interface MoviesViewController()<UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating>

@property(weak,nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) UISearchController *searchController;

@end

@implementation MoviesViewController

#pragma mark - ViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
}

-(void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

#pragma mark - UISearchBarDelegate

-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
}

#pragma mark - UISearchResultsUpdating

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
}

#pragma mark - Setup SearchController

-(void)setupSearchController {
    
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.definesPresentationContext = YES;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
}

@end
