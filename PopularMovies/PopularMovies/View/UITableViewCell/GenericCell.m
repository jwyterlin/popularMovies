//
//  GenericCell.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "GenericCell.h"

@implementation GenericCell

+(CGFloat)heightForCell {
    return 44.0f;
}

+(NSString *)identifier {
    return NSStringFromClass( [GenericCell class] );
}

@end
