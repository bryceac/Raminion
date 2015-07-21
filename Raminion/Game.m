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
    
    // check for bane card, in order to determine decks in supply
    if (b != nil) {
        for (int i = 0; i < [c count]; i++)
        {
            if ([c[i] event] == true && events < 2)
            {
                events++;
                [eventCards addObject:c[i]];
            }
            else
            {
                    
            }
        }
        
        
        if (events == 2)
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:12];
            
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:11];
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[1]] withObjectAtIndex:10];
            return 13;
            
        }
        else if (events == 1)
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:11];
            
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:10];
            return 12;
        }
        else
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:10];
            return 11;
        }
    }
    else
    {
        for (int i = 0; i < [c count]; i++)
        {
            if ([c[i] event] == true && events < 2)
            {
                events++;
                [eventCards addObject:c[i]];
            }
            else
            {
                
            }
        }
        
        if (events == 2)
        {
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:11];
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[1]] withObjectAtIndex:10];
            return 12;
            
        }
        else if (events == 1)
        {
            [c exchangeObjectAtIndex:[c indexOfObject:eventCards[0]] withObjectAtIndex:10];
            return 11;
        }
        else
        {
        }
    }
    return 10;
}
@end