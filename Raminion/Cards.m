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

- (id) initWithSupply:(NSDictionary*)s
{
    if (self = [super init])
    {
        [self createCards:s];
    }
    return self;
}

- (void)createCards:(NSDictionary *)s
{
    NSArray* supply = [s objectForKey:@"cards"];
    Card* card;
    
    for (int i = 0; i < [supply count]; i++)
    {
        NSDictionary* item = [supply objectAtIndex:i];
        NSArray* types = [item objectForKey:@"types"];
        
        if ([types containsObject:@"potion"]) {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:true kind:types];
        }
        else
        {
            card = [[Card alloc] initWithName:[item objectForKey:@"name"] collection:[item objectForKey:@"set"] cost:[[item objectForKey:@"cost"] intValue] potion:false kind:types];
        }
        
        [cards addObject:card];
    }
}

- (void)shuffle
{
    Shuffle* shuffle = [[Shuffle alloc] init];
}

@end
