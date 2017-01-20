//
//  NSDate+Helper.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 20/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

+(NSInteger)getYearFromDate:(NSDate *)date {
    
    if ( ! date )
        return 0;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger year = [calendar component:NSCalendarUnitYear fromDate:date];
    
    return year;
    
}

+(NSDate *)dateFromDefaultString:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-mm-dd";
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return date;
    
}

@end
