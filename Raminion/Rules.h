//
//  Rules.h
//  Raminion
//
//  Created by Bryce Campbell on 7/17/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Rules : NSObject

- (BOOL)colony:(NSMutableArray*)c;
- (BOOL)potion:(NSMutableArray*)c;
- (Card*)bane:(NSMutableArray*)c;
@end
