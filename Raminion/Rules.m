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
        if ([c[i] isKindOfClass:[Card class]] && [[c[i] kind] containsObject:@"potion"]) {
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
    
}
@end
