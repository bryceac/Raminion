//
//  SetListController.h
//  Raminion
//
//  Created by Bryce Campbell on 7/19/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Cocoa/Cocoa.h>
#import "Sets.h"

@interface SetListController : NSViewController<NSTableViewDelegate, NSTableViewDataSource>
{
    Sets* sets;
    IBOutlet NSTableView* groups;
}

- (void)retrieve:(NSArray*)s; // method to retrieve arrays

@property (retain) Sets* sets;
@property (retain) NSTableView* groups;
@end
