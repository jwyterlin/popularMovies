//
//  NSDate+Helper.h
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

+(NSInteger)getYearFromDate:(NSDate *)date;

+(NSDate *)dateFromDefaultString:(NSString *)dateString;

@end
