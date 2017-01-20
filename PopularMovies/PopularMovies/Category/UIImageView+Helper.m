//
//  UIImageView+Helper.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "UIImageView+Helper.h"

// Pods
#import "UIImageView+AFNetworking.h"

@implementation UIImageView (Helper)

-(void)downloadImageWithUrl:(NSString *)urlString completion:(void(^)(UIImage *image))completion {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
        if ( completion ) {
            completion( image );
        }
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
    }];
    
}

@end
