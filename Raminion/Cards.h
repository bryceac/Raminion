//
//  Cards.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Foundation/Foundation.h>

@interface Cards : NSObject
{
    NSMutableArray* cards; // variable to hold cards
    NSMutableArray* events; // variable to hold event cards
}

// custom initializer methods
- (id) initWithSupply:(NSArray*)s;

- (id) initWithSupply:(NSArray*)s limit:(NSMutableSet*)l;

// setter and accessor methods to populate and retrieve cards respectively
- (void)createCards:(NSArray*)s;

- (void)createCards:(NSArray*)s limit:(NSMutableSet*)l;

- (void)createCards:(NSArray*)s sets:(NSMutableSet*)c;

- (NSMutableArray*)events;

- (NSMutableArray*)cards;

@end
