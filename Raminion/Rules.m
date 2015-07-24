//
//  Rules.m
//  Raminion
//
//  Created by Bryce Campbell on 7/17/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import "Rules.h"

@implementation Rules

// default initializer
- (id) init
{
    if (self = [super init])
    {
        [self colony:nil];
        [self potion:nil];
        [self event:nil];
        [self bane:nil];
    }
    return self;
}

- (BOOL)colony:(NSMutableArray *)c
{
    int pros = 0; // variable that holds number of Prosperity cards
    
    // go through cards present in game and count the number that belong to the Prosperity set
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] collection] isEqualToString:@"Prosperity"]) {
            pros++;
        }
    }
    
    // if Prosperity cards make up at least half of the supply, put Colony and Platinum in the game
    if (pros >= 10/2) {
        return true;
    }
    return false;
}

// potion method is similar to the colony method, but will put in a potion if even one card requires it
- (BOOL)potion:(NSMutableArray *)c
{
    int potion = 0; // variable to hold number of potion cards
    
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] types] containsObject:@"potion"]) {
            potion++;
        }
    }
    
    if (potion >= 1) {
        return true;
    }
    return false;
}

// the following three methods are for setups with Dark Ages and check if ruins, shelters, and/or spoils are present
- (BOOL)ruins:(NSMutableArray *)c
{
    int looter = 0; // variable to hold number of looter cards
    
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] types] containsObject:@"looter"]) {
            looter++;
        }
    }
    
    if (looter >= 1) {
        return true;
    }
    return false;
}

- (BOOL)shelters:(NSMutableArray *)c
{
    int da = 0; // variable that holds number of Dark Ages cards
    int randValue = arc4random_uniform((uint32_t)[c count]);
    
    // go through cards present in game and count the number that belong to the Dark Ages set
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] collection] isEqualToString:@"Dark Ages"]) {
            da++;
        }
    }
    
    // if Prosperity cards make up at least half of the supply, put Colony and Platinum in the game
    if (da == 10) {
        return true;
    }
    else if ([[c[randValue] collection] isEqualToString:@"Dark Ages"])
    {
        return true;
    }
    return false;
}

- (BOOL)spoils:(NSMutableArray*)c
{
    NSArray* known = [[NSArray alloc] initWithObjects:@"Bandit Camp", @"Marauder", @"Pillage", nil];
    
    int s = 0;
    
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [known containsObject:[c[i] name]]) {
            s++;
        }
    }
    
    if (s >= 1) {
        return true;
    }
    
    return false;
}

// bane method checks for a particular card in the initial supply and chooses a card to counter it
- (Card*)bane:(NSMutableArray*)c
{
    BOOL yw = false; // variable used to detect presence of Young Witch
    Card* bane = [[Card alloc] init]; // variable that will contain the Bane card
    
    // go through initial supply and check if Young Witch is present
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] name] isEqualToString:@"Young Witch"]) {
            yw = true;
        }
    }
    
    // if Young Witch is Present, go through all available cards and choose a Bane card
    if (yw)
    {
        for (int j = 0; j < [c count]; j++)
        {
            // create variable that will hold a random number, so that the Bane card is not always the same
            int randValue = arc4random_uniform((uint32_t)[c count]);
            
            // look for card that does not require a potion, has a cost between 2 & 3, and is not already in game
            if ([c[randValue] isKindOfClass:[Card class]] && [c[randValue] cost] > 1 && [c[randValue] cost] <= 3 && [c[randValue] potion] != true && [c[randValue] event] != true && randValue > 9 && randValue < [c count])
            {
                bane = c[randValue]; // assign card to bane variable
                j = [c count]; // stop the loop, as it is no longer needed
            }
        }
    }
    else
    {
        bane = nil; // if Young Witch is not present make bane variable nil
    }
    
    // add (Bane) to card name, in order to make it distinguishable
    [bane setName:[NSString stringWithFormat:@"%@ (Bane)", [bane name]]];
    
    return bane;
}
@end
