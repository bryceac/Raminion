//
//  MasterViewController.m
//  Raminion
//
//  Created by Bryce Campbell on 7/15/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "MasterViewController.h"
#import "Cards.h"
#import "JSON.h"

@implementation MasterViewController
@synthesize table;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)shuffle:(id)sender
{
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 10;
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    Cards* cards = [Cards alloc] init
    NSTableCellView* cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
}

@end
