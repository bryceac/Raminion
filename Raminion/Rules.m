//
//  Rules.m
//  Raminion
//
//  Created by Bryce Campbell on 7/17/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Rules.h"

@implementation Rules

- (id) init
{
    if (self = [super init])
    {
        [self colony:nil];
        [self potion:nil];
        [self bane:nil];
    }
    return self;
}

- (BOOL)colony:(NSMutableArray *)c
{
    int pros = 0;
    
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] collection] isEqualToString:@"Prosperity"]) {
            pros++;
        }
    }
    
    if (pros >= 10/2) {
        return true;
    }
    return false;
}

- (BOOL)potion:(NSMutableArray *)c
{
    int potion = 0;
    
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

- (Card*)bane:(NSMutableArray *)c
{
    BOOL yw = false;
    Card* bane = [[Card alloc] init];
    
    for (int i = 0; i < 10; i++) {
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] name] isEqualToString:@"Young Witch"]) {
            yw = true;
        }
    }
    
    if (yw)
    {
        for (int j = 0; j < [c count]; j++)
        {
            int randValue = arc4random_uniform((uint32_t)[c count]);
            if ([c[randValue] isKindOfClass:[Card class]] && [c[randValue] cost] > 1 && [c[randValue] cost] <= 3 && [c[randValue] potion] != true && randValue > 9)
            {
                bane = c[randValue];
                j = [c count];
            }
        }
    }
    else
    {
        bane = nil;
    }
    
    [bane setName:[NSString stringWithFormat:@"%@ (Bane)", [bane name]]];
    
    return bane;
}
@end
