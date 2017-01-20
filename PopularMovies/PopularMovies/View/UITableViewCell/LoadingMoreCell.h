//
//  LoadingMoreCell.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "GenericCell.h"

@interface LoadingMoreCell : GenericCell

+(UITableViewCell *)cellWithTableView:(UITableView *)tableView text:(NSString *)text completion:(void(^)())completion;

@end
