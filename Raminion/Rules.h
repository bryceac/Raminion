//
//  Rules.h
//  Raminion
//
//  Created by Bryce Campbell on 7/17/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Rules : NSObject

- (BOOL)colony:(NSMutableArray*)c; // method to determine if Colonies and Platinum are used
- (BOOL)potion:(NSMutableArray*)c; // method to check if potion is needed
- (BOOL)ruins:(NSMutableArray*)c; // method to check if ruins are needed
- (BOOL)shelters:(NSMutableArray*)c; // method to check if shelters are used instead of estates
- (BOOL)spoils:(NSMutableArray*)c; // method to check if spoils are needed
- (Card*)bane:(NSMutableArray*)c; // method to determine Bane card
- (int)events; // method to randomly determine number of events
@end
