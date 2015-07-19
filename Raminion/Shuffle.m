//
//  Shuffle.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Shuffle.h"
#import "Card.h"
#import "Cards.h"

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

- (NSMutableArray*)shuffle:(NSArray*)s
{
    Cards* cards = [[Cards alloc] initWithSupply:s];
    
    for (int i = 0; i < [[cards cards] count]; i++)
    {
        int randValue = arc4random_uniform((uint32_t)[[cards cards] count]);
        [[cards cards] exchangeObjectAtIndex:i withObjectAtIndex:randValue];
    }
    return [cards cards];
}

- (NSMutableArray*)shuffle:(NSArray*)s limit:(int)n
{
    Cards* cards = [[Cards alloc] init];
    NSMutableSet* sets = [[NSMutableSet alloc] initWithCapacity:n];
    
    for (int i = 0; i < [s count]; i++) {
        NSDictionary* item = [s objectAtIndex:i];
        if ([sets count] < n) {
            [sets addObject:[item objectForKey:@"set"]];
        }
    }
    
    [cards createCards:s limit:sets];
    
    for (int h = 0; h < [s count]; h++)
    {
        int randValue = arc4random_uniform((uint32_t)[[cards cards] count]);
        [[cards cards] exchangeObjectAtIndex:h withObjectAtIndex:randValue];
    }
    
    return [cards cards];
}

@end
