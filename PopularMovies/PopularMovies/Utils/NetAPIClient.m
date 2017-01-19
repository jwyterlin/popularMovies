//
//  NetAPIClient.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "NetAPIClient.h"

// Utils
#import "Routes.h"

@implementation NetAPIClient

+(instancetype)sharedClient {
    
    static NetAPIClient *_sharedClientGet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClientGet = [[NetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:[Routes BASE_URL_API]]];
        _sharedClientGet.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClientGet.requestSerializer = [AFHTTPRequestSerializer serializer];
        
    });
    
    return _sharedClientGet;
    
}

@end
