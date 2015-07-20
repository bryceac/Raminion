//
//  Shuffle.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Foundation/Foundation.h>

@interface Shuffle : NSObject

- (id) initWithSupply:(NSArray*)s; // custom initializer

// acessor methods that randomize array and return a new array
- (NSMutableArray*)shuffle:(NSArray*)s;

- (NSMutableArray*)shuffle:(NSArray*)s limit:(int)n;

- (NSMutableArray*)shuffle:(NSArray*)s sets:(NSMutableArray*)c;

- (NSMutableArray*)shuffle:(NSArray*)s sets:(NSMutableArray*)c limit:(int)n;

@end
