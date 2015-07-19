//
//  Shuffle.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Shuffle.h"
#import "Card.h"

@implementation Shuffle

- (id) init
{
    return [self initWithArray:nil];
}

- (id) initWithArray:(NSMutableArray*)a
{
    if (self = [super init])
    {
        [self shuffle:a];
    }
    return self;
}

- (NSMutableArray*)shuffle:(NSMutableArray *)s
{
    for (int i = 0; i < [s count]; i++)
    {
        int randValue = arc4random_uniform((uint32_t)[s count]);
        [s exchangeObjectAtIndex:i withObjectAtIndex:randValue];
    }
    return s;
}

- (NSMutableArray*)shuffle:(NSMutableArray *)s andSetLimit:(int)n
{
    NSMutableSet* sets = [[NSMutableSet alloc] initWithCapacity:n];
    
    for (int h = 0; h < [s count]; h++)
    {
        int randValue = arc4random_uniform((uint32_t)[s count]);
        [s exchangeObjectAtIndex:h withObjectAtIndex:randValue];
    }
    
    
        for (int i = 0; i < [s count]; i++) {
            if ([sets count] < n && [s[i] isKindOfClass:[Card class]]) {
                [sets addObject:[s[i] collection]];
            }
        }
    
    NSLog(@"sets: %@", sets);
    
    for (int j = 0; j < [s count]; j++)
    {
        NSString* set = [s[j] collection];
        BOOL contains = [sets containsObject:set];
        if (!contains) {
            [s removeObjectAtIndex:j];
        }
    }
    return s;
}

@end
