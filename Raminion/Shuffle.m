//
//  Shuffle.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Shuffle.h"

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
        int randValue = (arc4random() % [s count] -1);
        id temp = s[i];
        
        s[i] = s[randValue];
        s[randValue] = temp;
    }
    return s;
}

@end
