//
//  Shuffle.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shuffle : NSObject

- (id) initWithSupply:(NSArray*)s;

- (NSMutableArray*)shuffle:(NSArray*)s;

- (NSMutableArray*)shuffle:(NSArray*)s limit:(int)n;

@end
