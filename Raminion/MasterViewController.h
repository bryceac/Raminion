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
    IBOutlet NSTableView* table;
    SetupViewController* setup;
}

@property (retain) NSTableView* table;
@property (retain) SetupViewController* setup;

- (IBAction)shuffle:(id)sender;

@end
