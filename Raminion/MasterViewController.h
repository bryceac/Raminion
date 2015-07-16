//
//  MasterViewController.h
//  Raminion
//
//  Created by Bryce Campbell on 7/15/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MasterViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>
{
    IBOutlet NSTableView* table;
}

@property (retain) NSTableView* table;

- (IBAction)shuffle:(id)sender;

@end
