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
    
    for (int h = 0; h < n; h++)
    {
        int randSet = arc4random_uniform((uint32_t)[s count]);
        if ([s[randSet] isKindOfClass:[Card class]]) {
            [sets addObject:[s[randSet] collection]];
        }
    }
    
    for (int i = 0; i < [s count]; i++)
    {
        int randValue = arc4random_uniform((uint32_t)[s count]);
        [s exchangeObjectAtIndex:i withObjectAtIndex:randValue];
    }
    
    for (int j = 0; j < [sets count]; j++)
    {
        if ([s[j] isKindOfClass:[Card class]] && [sets containsObject:[s[j] collection]] == false) {
            [s removeObject:s[j]];
        }
    }
    return s;
}

@end
