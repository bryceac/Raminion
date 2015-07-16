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

- (id) initWithSupply:(NSDictionary*)s;

- (void)createCards:(NSDictionary*)s;

- (void)shuffle;

- (NSMutableArray*)cards;

@end
