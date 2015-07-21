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
    int supply = 0;
    int events = 0;
    
    // if there is a Bane, make sure it is the 11th item and that there are 11 rows, otherwise return only ten rows
    if (b != nil)
    {
        for (int i = 0; [c count]; i++)
        {
            while (supply < 11)
            {
                if ([c[i] event] == true && events < 2) {
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
        
        supply = supply + events;
        
        if (supply == 13)
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:supply-1];
            
            [c exchangeObjectAtIndex:[eventCards indexOfObject:eventCards[0]] withObjectAtIndex:supply-2];
            [c exchangeObjectAtIndex:[eventCards indexOfObject:eventCards[1]] withObjectAtIndex:supply-3];
        }
        else if (supply == 12)
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:supply-1];
            
            [c exchangeObjectAtIndex:[eventCards indexOfObject:eventCards[0]] withObjectAtIndex:supply-2];
        }
        else
        {
            int index = [c indexOfObject:b];
            [c exchangeObjectAtIndex:index withObjectAtIndex:supply-1];
        }
    }
    else
    {
        for (int i = 0; [c count]; i++)
        {
            while (supply < 10)
            {
                if ([c[i] event] == true && events < 2) {
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
        
        supply = supply + events;
        
        if (supply == 12)
        {
            [c exchangeObjectAtIndex:[eventCards indexOfObject:eventCards[0]] withObjectAtIndex:supply-1];
            [c exchangeObjectAtIndex:[eventCards indexOfObject:eventCards[1]] withObjectAtIndex:supply-2];
        }
        else if (supply == 11)
        {
            [c exchangeObjectAtIndex:[eventCards indexOfObject:eventCards[0]] withObjectAtIndex:supply-1];
        }
        else
        {
        }
    }
    return supply;
}
@end
