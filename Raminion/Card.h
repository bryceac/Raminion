//
//  Card.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
{
    NSString *name, *collection; // variable to hold card name and set name
    NSArray* types; // array that will contain what kind of card an object is
    int cost; // variable that holds that card's price
    BOOL potion; // variable that specifies whether a potion is needed to buy it or not
    BOOL event; // variable that specifies whether card is an event or not
}

// custom initializer method
- (id) initWithName:(NSString*)n collection:(NSString*)c cost:(int)f potion:(BOOL)b event:(BOOL)e types:(NSArray*)k;

// setter methods
- (void)setName:(NSString*)n;
- (void)setCollection:(NSString*)s;
- (void)setPotion:(BOOL)b;
- (void)setEvent:(BOOL)e;
- (void)setTypes:(NSArray*)k;
- (void)setCost:(int)c;

// accessor methods
- (NSString*)name;
- (NSString*)collection;
- (BOOL)potion;
- (BOOL)event;
- (NSArray*)types;
- (int)cost;

@end
