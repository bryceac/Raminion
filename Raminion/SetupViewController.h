//
//  SetupViewController.h
//  Raminion
//
//  Created by Bryce Campbell on 7/18/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Cocoa/Cocoa.h>

@interface SetupViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>
{
    IBOutlet NSTableView* setup; // variable to control the preparation table
    NSMutableArray* supply; // variable that will hold cards needed for various games and whether or not they are needed
}

@property (retain) NSTableView* setup; // allow setup table to be synthesizable

- (void)required:(BOOL)c potion:(BOOL)p ruins:(BOOL)r shelter:(BOOL)s spoils:(BOOL)t; // method to populate table with required cards
@end
