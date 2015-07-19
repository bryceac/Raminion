//
//  MasterViewController.h
//  Raminion
//
//  Created by Bryce Campbell on 7/15/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SetupViewController.h"

@interface MasterViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>
{
    IBOutlet NSTableView* table; // variable for table view
    IBOutlet NSTextField* limit; // variable to read textfield input
    SetupViewController* setup; // variable to hold a child view controller
    NSMutableArray* cards; // create variable needed for table
}

// the following makes the variables used for GUI elements to be synthesizable;
@property (retain) NSTableView* table;
@property (retain) SetupViewController* setup;
@property (retain) NSTextField* limit;

- (IBAction)shuffle:(id)sender; // button action that will perform shuffling and other duties

@end
