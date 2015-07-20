//
//  Sets.m
//  Raminion
//
//  Created by Bryce Campbell on 7/19/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Sets.h"

@implementation Sets

// default initializer
- (id) init
{
    return [self initWithArray:nil];
}

// main initializer
- (id) initWithArray:(NSArray *)s
{
    if (self = [super init]) {
        sets = [[NSMutableOrderedSet alloc] init];
        [self createSets:s];
        
    }
    
    return self;
}

- (void)createSets:(NSArray *)s
{
    // go through JSON file and get all sets present, placing them in the sets variable
    for (int i = 0; i < [s count]; i++)
    {
        NSDictionary* item = [s objectAtIndex:i];
        [sets addObject:[item objectForKey:@"set"] ];
    }
}

- (NSMutableOrderedSet*)sets
{
    return sets;
}

@end
