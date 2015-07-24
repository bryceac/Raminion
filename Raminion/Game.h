//
//  Game.h
//  Raminion
//
//  Created by Bryce Campbell on 7/21/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Game : NSObject
{
    NSMutableArray* game;
}
- (int)supply:(NSMutableArray*)c bane:(Card*)b; //method to get necessary number of rows.
@property NSMutableArray* game;
@end
