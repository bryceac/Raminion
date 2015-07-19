//
//  Cards.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cards : NSObject
{
    NSMutableArray* cards;
}

- (id) initWithSupply:(NSArray*)s;

- (void)createCards:(NSArray*)s;

- (void)shuffle;

- (void)shuffle:(int)n;

- (NSMutableArray*)cards;

@end
