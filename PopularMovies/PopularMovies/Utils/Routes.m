//
//  Routes.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "Routes.h"

@implementation Routes

+(NSString *)API_TOKEN {
    
    return @"bcdddf36ef7e3fb5c83ef439baf0f9b3";
    
}

+(NSString *)BASE_URL_API {
    
    return @"https://api.themoviedb.org/3";
    
}

+(NSString *)WS_MOVIE_POPULAR {
    return @"/movie/popular";
}

@end
