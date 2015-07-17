//
//  Card.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
{
    NSString *name, *collection;
    NSArray* types;
    int cost;
    BOOL potion;
}

// custom initializer method
- (id) initWithName:(NSString*)n collection:(NSString*)c cost:(int)f potion:(BOOL)b types:(NSArray*)k;

// setter methods
- (void)setName:(NSString*)n;
- (void)setCollection:(NSString*)s;
- (void)setPotion:(BOOL)b;
- (void)setTypes:(NSArray*)k;
- (void)setCost:(int)c;

// accessor methods
- (NSString*)name;
- (NSString*)collection;
- (BOOL)potion;
- (NSArray*)types;
- (int)cost;

@end
