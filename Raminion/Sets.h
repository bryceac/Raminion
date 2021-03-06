//
//  Sets.h
//  Raminion
//
//  Created by Bryce Campbell on 7/19/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Foundation/Foundation.h>

@interface Sets : NSObject
{
    NSMutableOrderedSet* sets; // variable to hold sets
}

- (id) initWithArray:(NSArray*)s; // custom initializer

- (void)createSets:(NSArray*)s; // variable that populate sets variable

- (NSMutableOrderedSet*)sets; // accessor method
@end
