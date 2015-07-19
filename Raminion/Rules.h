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

- (BOOL)colony:(NSMutableArray*)c; // method to determine if Colonies and Platinum are used
- (BOOL)potion:(NSMutableArray*)c; // method to check if potion is needed
- (Card*)bane:(NSMutableArray*)c; // method to determine Bane card
@end
