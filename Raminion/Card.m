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
    return [self initWithName:nil collection:nil cost:0 potion:false kind:nil];
}

- (id) initWithName:(NSString*)n collection:(NSString*)c cost:(int)f potion:(BOOL)b kind:(NSArray*)k
{
    if (self = [super init]) {
        [self setName:n];
        [self setCollection:c];
        [self setCost:f];
        [self setPotion:b];
        [self setKind:k];
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

- (void)setCost:(int)c
{
    cost = c;
}

- (int)cost
{
    return cost;
}

@end
