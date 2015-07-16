//
//  Card.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id) init
{
    if (self = [super init]) {
        [self setName:nil];
        [self setCollection:nil];
        [self setKind:nil];
        [self setPotion:false];
    }
    return self;
}

- (void) setName:(NSString *)n
{
    name = n;
}

- (NSString*)name
{
    return name;
}

- (void) setCollection:(NSString *)s
{
    collection = s;
}

- (NSString*)collection
{
    return collection;
}

- (void) setKind:(NSArray *)k
{
    kind = [NSArray arrayWithArray:k];
}

- (NSArray*)kind
{
    return kind;
}

- (void) setPotion:(BOOL)b
{
    potion = b;
}

- (BOOL)potion
{
    return potion;
}

@end
