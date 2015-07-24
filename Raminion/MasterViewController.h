//
//  MasterViewController.h
//  Raminion
//
//  Created by Bryce Campbell on 7/15/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Cocoa/Cocoa.h>
#import "SetupViewController.h"
#import "SetListController.h"
#import "Game.h"

@interface MasterViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>
{
    IBOutlet NSTableView* table; // variable for table view
    IBOutlet NSTextField* limit; // variable to read textfield input
    SetupViewController* setup; // variable to hold a child view controller
    SetListController* sets; //variable to deal with sets
    NSMutableArray* cards; // create variable needed for table
    Game* supply; // variable to hold cards used in game
}

// the following makes the variables used for GUI elements to be synthesizable;
@property (retain) NSTableView* table;
@property (retain) SetupViewController* setup;
@property (retain) SetListController* sets;
@property (retain) NSTextField* limit;

- (IBAction)shuffle:(id)sender; // button action that will perform shuffling and other duties

@end
