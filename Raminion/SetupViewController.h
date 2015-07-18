//
//  SetupViewController.h
//  Raminion
//
//  Created by Bryce Campbell on 7/18/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SetupViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>
{
    IBOutlet NSTableView* setup;
}

@property (retain) NSTableView* setup;

- (void)required:(BOOL)c potion:(BOOL)p; // method to populate table with required cards
@end
