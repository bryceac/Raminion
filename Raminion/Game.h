//
//  Game.h
//  Raminion
//
//  Created by Bryce Campbell on 7/21/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Rules.h"
@interface Game : NSObject
{
    NSMutableArray* game;
    Rules* rules; // needed for event counting
}
- (int)supply:(NSMutableArray*)c bane:(Card*)b; //method to get necessary number of rows.
- (int)supply:(NSMutableArray*)c bane:(Card*)b events:(NSMutableArray*)events; //method to get necessary number of rows with adventures present
@property NSMutableArray* game;
@end
