//
//  UIImageView+Helper.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Helper)

-(void)downloadImageWithUrl:(NSString *)urlString completion:(void(^)(UIImage *image))completion;

@end
