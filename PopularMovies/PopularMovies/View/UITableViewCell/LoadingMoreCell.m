//
//  LoadingMoreCell.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "LoadingMoreCell.h"

// Category
#import "UIView+Helper.h"

@implementation LoadingMoreCell

+(UITableViewCell *)cellWithTableView:(UITableView *)tableView text:(NSString *)text completion:(void(^)())completion {
    
    NSString *identifier = NSStringFromClass( [LoadingMoreCell class] );
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ( cell == nil )
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    cell.textLabel.text = text;
    cell.textLabel.textColor = [UIColor grayColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIActivityIndicatorView *loading = [cell.contentView viewWithTag:1];
    
    if ( ! loading ) {
        
        loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        loading.x = [UIScreen mainScreen].bounds.size.width - loading.width - 16.0f;
        loading.y = 13.0f;
        loading.hidesWhenStopped = YES;
        loading.tag = 1;
        
        [cell.contentView addSubview:loading];
        
    }
    
    [loading startAnimating];
    
    if ( completion )
        completion();
    
    return cell;
    
}

@end
