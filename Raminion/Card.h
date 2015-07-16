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
    NSArray* kind;
    int cost;
    BOOL potion;
}

// setter methods
- (void)setName:(NSString*)n;
- (void)setCollection:(NSString*)s;
- (void)setPotion:(BOOL)b;
- (void)setKind:(NSArray*)k;
- (void)setCost:(int)c;

// accessor methods
- (NSString*)name;
- (NSString*)collection;
- (BOOL)potion;
- (NSArray*)kind;
- (int)cost;

@end
