//
//  Reachability+Helper.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "Reachability+Helper.h"

@implementation Reachability (Helper)

+(BOOL)isNetworkReachable {
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    [reachability startNotifier];
    
    if ( networkStatus == NotReachable || [reachability connectionRequired] )
        return NO;
    else
        return YES;
    
}

@end
