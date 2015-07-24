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
    int events = 0; // variable to count number of events encountered
    
    // check for bane card, in order to determine decks in supply
    if (b != nil) {
        for (int h = 0; h < 11; h++) {
            for (int i = 0; i < [c count]; i++)
            {
                if ([c[i] event] == true && events < 2)
                {
                    events++;
                }
                else
                {
                    
                }
            }
        }
        
        if (events == 2)
        {
            game = [[NSMutableArray alloc] initWithCapacity:13];
            
            for (int i = 0; i < 12; i++)
            {
                [game addObject:c[i]];
            }
            
            [game addObject:b];
            
        }
        else if (events == 1)
        {
            game = [[NSMutableArray alloc] initWithCapacity:12];
            
            for (int i = 0; i < 11; i++)
            {
                [game addObject:c[i]];
            }
            
            [game addObject:b];
        }
        else
        {
            game = [[NSMutableArray alloc] initWithCapacity:11];
            for (int i = 0; i < 10; i++)
            {
                [game addObject:c[i]];
            }
            
            [game addObject:b];
        }
    }
    else
    {
        for (int h = 0; h < 10; h++) {
            for (int i = 0; i < [c count]; i++)
            {
                if ([c[i] event] == true && events < 2)
                {
                    events++;
                }
                else
                {
                }
            }
        }
        
        if (events == 2)
        {
            game = [[NSMutableArray alloc] initWithCapacity:12];
            
            for (int i = 0; i < 12; i++)
            {
                [game addObject:c[i]];
            }
            
        }
        else if (events == 1)
        {
            game = [[NSMutableArray alloc] initWithCapacity:11];
            
            for (int i = 0; i < 11; i++)
            {
                [game addObject:c[i]];
            }
        }
        else
        {
            game = [[NSMutableArray alloc] initWithCapacity:10];
            
            for (int i = 0; i < 10; i++)
            {
                [game addObject:c[i]];
            }
        }
    }
    return (int)game.count;
}
@end