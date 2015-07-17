//
//  Shuffle.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Shuffle.h"
#import "Card.h"

@implementation Shuffle

- (id) init
{
    return [self initWithArray:nil];
}

- (id) initWithArray:(NSMutableArray*)a
{
    if (self = [super init])
    {
        [self shuffle:a];
    }
    return self;
}

- (NSMutableArray*)shuffle:(NSMutableArray *)s
{
    for (int i = 0; i < [s count]; i++)
    {
        int randValue = arc4random_uniform((uint32_t)[s count]);
        
        // following statements make sure that potion, colony, and platinum are always the last three items of array
        if ([s[i] isKindOfClass:[Card class]] && [[s[i] name] isEqualToString:@"Potion"]) {
            [s exchangeObjectAtIndex:i withObjectAtIndex:[s count]-3];
        }
        if ([s[i] isKindOfClass:[Card class]] && [[s[i] name] isEqualToString:@"Platinum"])
        {
            [s exchangeObjectAtIndex:i withObjectAtIndex:[s count]-2];
        }
        if ([s[i] isKindOfClass:[Card class]] && [[s[i] name] isEqualToString:@"Colony"])
        {
            [s exchangeObjectAtIndex:i withObjectAtIndex:[s count]-1];
        }
        
        [s exchangeObjectAtIndex:i withObjectAtIndex:randValue];
    }
    return s;
}

@end
