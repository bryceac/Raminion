//
//  Game.m
//  Raminion
//
//  Created by Bryce Campbell on 7/21/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize game;
- (id)init
{
    if (self = [super init])
    {
    }
    return self;
}

- (int) supply:(NSMutableArray*)c bane:(Card *)b
{
    // check for bane card, in order to determine decks in supply
    if (b != nil) {
        
        game = [[NSMutableArray alloc] initWithCapacity:11];
        
        for (int i = 0; i < 10; i++)
        {
            [game addObject:c[i]];
        }
            
        [game addObject:b];
    }
    else
    {
        game = [[NSMutableArray alloc] initWithCapacity:10];
            
        for (int i = 0; i < 10; i++)
        {
            [game addObject:c[i]];
        }
    }
    return (int)game.count;
}

- (int)supply:(NSMutableArray *)c bane:(Card *)b events:(NSMutableArray *)events
{
    rules = [[Rules alloc] init];
    
    int e = [rules events];
    NSMutableArray* chosen = [[NSMutableArray alloc] init];
    
    if (e == 2 && b != nil)
    {
        game = [[NSMutableArray alloc] initWithCapacity:13];
        
        for (int i = 0; i < 10; i++)
        {
            [game addObject:c[i]];
        }
        
        for (int i = 0; i < 2; i++)
        {
            int randValue = arc4random_uniform((u_int32_t)[events count]);
            
            if ([chosen containsObject:events[randValue]])
            {
            }
            else
            {
                [chosen addObject:events[randValue]];
            }
        }
        
        for (int i = 0; i < [chosen count]; i++)
        {
            [game addObject:chosen[i]];
        }
        
        [game addObject:b];
    }
    
    else if (e == 1 && b != nil)
    {
        game = [[NSMutableArray alloc] initWithCapacity:12];
        
        for (int i = 0; i < 10; i++)
        {
            [game addObject:c[i]];
        }

        int randValue = arc4random_uniform((u_int32_t)[events count]);
        
        [chosen addObject:events[randValue]];
        
        [game addObject:chosen[0]];
        
        [game addObject:b];
    }
    else if (e == 2 && b == nil)
    {
        game = [[NSMutableArray alloc] initWithCapacity:12];
        
        for (int i = 0; i < 10; i++)
        {
            [game addObject:c[i]];
        }
        
        for (int i = 0; i < 2; i++)
        {
            int randValue = arc4random_uniform((u_int32_t)[events count]);
            
            if ([chosen containsObject:events[randValue]])
            {
            }
            else
            {
                [chosen addObject:events[randValue]];
            }
        }
        
        for (int i = 0; i < [chosen count]; i++)
        {
            [game addObject:chosen[i]];
        }
    }
    else if (e == 1 && b == nil)
    {
        game = [[NSMutableArray alloc] initWithCapacity:11];
        
        for (int i = 0; i < 10; i++)
        {
            [game addObject:c[i]];
        }
        
        int randValue = arc4random_uniform((u_int32_t)[events count]);
        
        [chosen addObject:events[randValue]];
        
        [game addObject:chosen[0]];
    }
    else
    {
        game = [[NSMutableArray alloc] initWithCapacity:10];
        
        for (int i = 0; i < 10; i++)
        {
            [game addObject:c[i]];
        }
    }
    return (int)game.count;
}
@end