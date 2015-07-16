//
//  MasterViewController.m
//  Raminion
//
//  Created by Bryce Campbell on 7/15/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "MasterViewController.h"
#import "Cards.h"
#import "Card.h"
#import "JSON.h"

@implementation MasterViewController
@synthesize table;

JSON *json;
Cards* cards;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
}

- (IBAction)shuffle:(id)sender
{
    json = [[JSON alloc] initWithFile:@"dominion"];
    cards = [[Cards alloc] initWithSupply:[json json]];
    
    table.delegate = self;
    table.dataSource = self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 10;
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if ([tableColumn.identifier isEqualToString:@"card"])
    {
        cell.textField.stringValue = [[cards cards][row] name];
    }
    else if ([tableColumn.identifier isEqualToString:@"set"])
    {
        cell.textField.stringValue = [[cards cards][row] collection];
    }
    else
    {
        cell.textField.stringValue = [NSString stringWithFormat:@"%d", [[cards cards][row] cost]];
    }
    
    return cell;
}

@end
