//
//  Cards.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Cards.h"
#import "Card.h"
#import "Shuffle.h"

@implementation Cards

- (id) init
{
    return [self initWithSupply:nil];
}

- (id) initWithSupply:(NSArray*)s
{
    if (self = [super init])
    {
        cards = [[NSMutableArray alloc] init];
        [self createCards:s];
    }
    return self;
}

- (void)createCards:(NSArray *)s
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
        
        [cards addObject:card];
    }
}

- (void)shuffle
{
    Shuffle* shuffle = [[Shuffle alloc] init];
    
    cards = [shuffle shuffle:cards];
}

- (void)shuffle:(int)n
{
    Shuffle* shuffle = [[Shuffle alloc] init];
    
    cards = [shuffle shuffle:cards];
}

- (NSMutableArray*)cards
{
    return cards;
}

@end
