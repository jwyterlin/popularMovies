//
//  UITableView+Helper.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "UITableView+Helper.h"

@implementation UITableView (Helper)

-(void)registerNibForCellReuseIdentifier:(NSString *)identifier {
    
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
    
}

@end
