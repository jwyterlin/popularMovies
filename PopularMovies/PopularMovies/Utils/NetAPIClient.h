//
//  NetAPIClient.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetAPIClient : AFHTTPSessionManager

+(instancetype)sharedClient;

@end
