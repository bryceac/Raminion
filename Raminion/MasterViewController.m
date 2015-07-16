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
    NSLog(@"\r\n%@", [json json]);
    NSLog(@"Cards: %d", cards.cards.count);
    
}

- (IBAction)shuffle:(id)sender
{
    
    for (int i = 0; i < cards.cards.count; i++)
    {
        NSLog(@"Card: %@ Set: %@, Cost: %d", [[cards cards][i] name], [[cards cards][i] collection], [[cards cards][i] cost]);
    }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 10;
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    json = [[JSON alloc] initWithFile:@"dominion"];
    cards = [[Cards alloc] initWithSupply:[json json]];
    
    NSTableCellView* cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if ([tableColumn.identifier isEqualToString:@"card"])
    {
        if ([[cards cards][row] name] != nil) {
            [cell.textField setStringValue:[[cards cards][row] name]];
        }
        else
        {
            NSLog(@"card has no name");
        }
    }
    else if ([tableColumn.identifier isEqualToString:@"set"])
    {
        if ([[cards cards][row] collection] != nil) {
            [cell.textField setStringValue:[[cards cards][row] name]];
        }
        else
        {
            NSLog(@"card has no set");
        }
    }
    else
    {
        if ([[cards cards][row] cost] != nil) {
            [cell.textField setStringValue:[NSString stringWithFormat:@"%d", [[cards cards][row] cost]]];
        }
        
        NSLog(@"card has no cost");
    }
    
    return cell;
}

@end
