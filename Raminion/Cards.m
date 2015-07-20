//
//  Cards.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Cards.h"
#import "Card.h"

@implementation Cards

// default initializer
- (id) init
{
    return [self initWithSupply:nil];
}

// main initializer
- (id) initWithSupply:(NSArray*)s
{
    if (self = [super init])
    {
        cards = [[NSMutableArray alloc] init]; // initialize NSMutableArray object
        [self createCards:s]; // create cards array
    }
    return self;
}

// initializer to quickly limit content to certain sets
- (id) initWithSupply:(NSArray*)s limit:(NSMutableSet*)l
{
    if (self = [super init])
    {
        cards = [[NSMutableArray alloc] init];
        [self createCards:s limit:l]; // create cards array with only certain sets
    }
    return self;
}

// default createCards method that populates array with cards from all sets
- (void)createCards:(NSArray *)s
{
    Card* card; // declare variable for card objects
    
    for (int i = 0; i < [s count]; i++)
    {
        NSDictionary* item = [s objectAtIndex:i]; // get Dictionary value of current array element
        NSArray* types = [item objectForKey:@"types"]; // get the types array from Dictionary
        
        // check if card is a potion card and mark it true or false, depending on results.
        if ([types containsObject:@"potion"]) {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:true types:types];
        }
        else
        {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:false types:types];
        }
        
        [cards addObject:card]; // add object to array
    }
}

// variant of createCards array that will only populate the array with cards from certain number of sets
- (void)createCards:(NSArray *)s limit:(NSMutableSet*)l
{
    Card* card;
    for (int i = 0; i < [s count]; i++)
    {
        NSDictionary* item = [s objectAtIndex:i];
        NSArray* types = [item objectForKey:@"types"];
        
        if ([types containsObject:@"potion"]) {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:true types:types];
        }
        else
        {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:false types:types];
        }
        
        // check if card belongs to one of the chosen sets, and if so, add it to the array
        if ([l containsObject:[card collection]]) {
            [cards addObject:card];
        }
    }
}

// variant of the shuffle method that will only use certain sets
- (void)createCards:(NSArray *)s sets:(NSMutableSet *)c
{
    Card* card; // declare variable for card objects
    
    for (int i = 0; i < [s count]; i++)
    {
        NSDictionary* item = [s objectAtIndex:i]; // get Dictionary value of current array element
        NSArray* types = [item objectForKey:@"types"]; // get the types array from Dictionary
        
        // check if card is a potion card and mark it true or false, depending on results.
        if ([types containsObject:@"potion"]) {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:true types:types];
        }
        else
        {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:false types:types];
        }
        
        [cards addObject:card]; // add object to array
    }
}

- (NSMutableArray*)cards
{
    return cards;
}

@end
