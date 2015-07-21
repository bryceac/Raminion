//
//  Shuffle.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import "Shuffle.h"
#import "Card.h"
#import "Cards.h"

@implementation Shuffle

// default initializer
- (id) init
{
    return [self initWithSupply:nil];
}

// main initializer
- (id) initWithSupply:(NSMutableArray*)a
{
    if (self = [super init])
    {
        [self shuffle:a];
    }
    return self;
}

// shuffle method takes all cards and randomizes them
- (NSMutableArray*)shuffle:(NSArray*)s
{
    Cards* cards = [[Cards alloc] initWithSupply:s]; // create Cards object
    
    // perform shuffle
    for (int i = 0; i < [[cards cards] count]; i++)
    {
        int randValue = arc4random_uniform((uint32_t)[[cards cards] count]);
        [[cards cards] exchangeObjectAtIndex:i withObjectAtIndex:randValue];
    }
    return [cards cards];
}

// variant of shuffle method that takes cards from only a certain number of sets
- (NSMutableArray*)shuffle:(NSArray*)s limit:(int)n
{
    Cards* cards = [[Cards alloc] init];
    NSMutableSet* sets = [[NSMutableSet alloc] initWithCapacity:n]; // create set object that has a specified capacity
    
    // populate the set
    for (int i = 0; i < [s count]; i++) {
        NSDictionary* item = [s objectAtIndex:i];
        if ([sets count] < n) {
            [sets addObject:[item objectForKey:@"set"]];
        }
    }
    
    [cards createCards:s limit:sets]; // create supply based on the set
    
    for (int h = 0; h < [[cards cards] count]; h++)
    {
        int randValue = arc4random_uniform((uint32_t)[[cards cards] count]);
        [[cards cards] exchangeObjectAtIndex:h withObjectAtIndex:randValue];
    }
    
    return [cards cards];
}

// the following are similar to the previous shuffle methods, but allow sets specification
- (NSMutableArray*)shuffle:(NSArray*)s sets:(NSMutableArray *)c
{
    Cards* cards = [[Cards alloc] init]; // create Cards object
    NSMutableSet* sets = [[NSMutableSet alloc] initWithArray:c];
    
    [cards createCards:s sets:sets];
    
    // perform shuffle
    for (int i = 0; i < [[cards cards] count]; i++)
    {
        int randValue = arc4random_uniform((uint32_t)[[cards cards] count]);
        [[cards cards] exchangeObjectAtIndex:i withObjectAtIndex:randValue];
    }
    return [cards cards];
}

- (NSMutableArray*)shuffle:(NSArray*)s sets:(NSMutableArray *)c limit:(int)n
{
    Cards* cards = [[Cards alloc] init];
    NSMutableSet* sets = [[NSMutableSet alloc] initWithCapacity:n]; // create set object that has a specified capacity
    
    // populate the set with randomly select set from list of chosen sets
    for (int i = 0; i < [c count]; i++) {
        int randValue = arc4random_uniform((uint32_t)[c count]);
        if ([sets count] < n) {
            [sets addObject:c[randValue]];
        }
    }
    
    [cards createCards:s limit:sets]; // create supply based on the set
    
    for (int h = 0; h < [[cards cards] count]; h++)
    {
        int randValue = arc4random_uniform((uint32_t)[[cards cards] count]);
        [[cards cards] exchangeObjectAtIndex:h withObjectAtIndex:randValue];
    }
    
    return [cards cards];
}

@end
