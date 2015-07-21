//
//  Card.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import "Card.h"

@implementation Card

// default initializer that is used to create empty object
- (id) init
{
    return [self initWithName:nil collection:nil cost:0 potion:false event:false types:nil];
}

// method to create object with data to prepopulate it
- (id) initWithName:(NSString*)n collection:(NSString*)c cost:(int)f potion:(BOOL)b event:(BOOL)e types:(NSArray*)k
{
    if (self = [super init]) {
        [self setName:n];
        [self setCollection:c];
        [self setCost:f];
        [self setPotion:b];
        [self setEvent:e];
        [self setTypes:k];
    }
    return self;
}

// implement all setter and accessors methods
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

- (void) setTypes:(NSArray *)k
{
    types = [NSArray arrayWithArray:k];
}

- (NSArray*)types
{
    return types;
}

- (void) setPotion:(BOOL)b
{
    potion = b;
}

- (BOOL)potion
{
    return potion;
}

- (void)setEvent:(BOOL)e
{
    event = e;
}

- (BOOL)event
{
    return event;
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
