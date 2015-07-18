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
#import "Rules.h"

@implementation MasterViewController
@synthesize table;

JSON *json;
Cards* cards;
Rules* rules;
Card *bane, *potion, *platinum, *colony;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)shuffle:(id)sender
{
    json = [[JSON alloc] initWithFile:@"dominion"];
    cards = [[Cards alloc] initWithSupply:[json supply]];
    rules = [[Rules alloc] init];
    
    [cards shuffle];
    
    table.delegate = self;
    table.dataSource = self;
    
    [table reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    bane = [rules bane:[cards cards]];
    
    if (bane != nil && [rules colony:[cards cards]] == false && [rules potion:[cards cards]] == false)
    {
        int index = [[cards cards] indexOfObject:bane];
        [[cards cards] exchangeObjectAtIndex:index withObjectAtIndex:10];
        return 11;
    }
    return 10;
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    Card* card = [cards cards][row];
    
    NSTableCellView* cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    if ([tableColumn.identifier isEqualToString:@"card"])
    {
        [cell.textField setStringValue:[card name]];
    }
    else if ([tableColumn.identifier isEqualToString:@"set"])
    {
            [cell.textField setStringValue:[card collection]];
    }
    else
    {
            [cell.textField setStringValue:[NSString stringWithFormat:@"%d", [card cost]]];
    }
    
    return cell;
}

@end
