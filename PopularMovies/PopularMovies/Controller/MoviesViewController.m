//
//  MoviesViewController.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 18/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "MoviesViewController.h"

@interface MoviesViewController()<UITableViewDataSource>

@property(weak,nonatomic) IBOutlet UITableView *tableView;

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

@end
