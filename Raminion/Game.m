//
//  Game.m
//  Raminion
//
//  Created by Bryce Campbell on 7/21/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Game.h"

@implementation Game
- (id)init
{
    if (self = [super init])
    {
        eventCards = [[NSMutableArray alloc] init];
    }
    return self;
}

- (int) supply:(NSMutableArray*)c bane:(Card *)b
{
    int events = 0; // variable to count number of events encountered
    int supply = 0; //variable to count supply
    
    // check for bane card, in order to determine decks in supply
    if (b != nil) {
        while (supply < 11) {
            for (int i = 0; i < [c count]; i++)
            {
                if ([c[i] event] == true && events < 2)
                {
                    events++;
                    [eventCards addObject:c[i]];
                }
                else if ([c[i] event] == true)
                {
                    
                }
                else
                {
                    supply++;
                }
            }
        }
        
        supply += events;
        
        
        if (supply == 13)
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:12];
            
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:11];
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[1]] withObjectAtIndex:10];
        }
        else if (supply == 12)
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:11];
            
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:10];
        }
        else
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:10];
        }
    }
    else
    {
        while (supply < 10) {
            for (int i = 0; i < [c count]; i++)
            {
                if ([c[i] event] == true && events < 2)
                {
                    events++;
                    [eventCards addObject:c[i]];
                }
                else if ([c[i] event] == true)
                {
                    
                }
                else
                {
                    supply++;
                }
            }
        }
        
        supply += events;
        
        if (supply == 12)
        {
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:11];
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[1]] withObjectAtIndex:10];
        }
        else if (supply == 11)
        {
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:10];
        }
        else
        {
        }
    }
    return supply;
}
@end