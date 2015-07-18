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
Card *bane;

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
    
    /* if ([rules potion:[cards cards]] && [rules colony:[cards cards]])
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Potion"];
        [supply addObject:item];
        [item removeObjectForKey:@"Potion"];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Colony & Platinum"];
        [supply addObject:item];
        
    }
    if ([rules potion:[cards cards]])
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:0] forKey:@"Potion"];
        [supply addObject:item];
        [item removeObjectForKey:@"Potion"];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Colony & Platinum"];
        [supply addObject:item];
        
    }
    if ([rules colony:[cards cards]])
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Potion"];
        [supply addObject:item];
        [item removeObjectForKey:@"Potion"];
        [item setObject:[NSNumber numberWithInt:0] forKey:@"Colony & Platinum"];
        [supply addObject:item];
        
    } */
    
    table.delegate = self;
    table.dataSource = self;
    
    [table reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    /* if (tableView == table)
    { */
    bane = [rules bane:[cards cards]];
    
    if (bane != nil)
    {
        int index = [[cards cards] indexOfObject:bane];
        [[cards cards] exchangeObjectAtIndex:index withObjectAtIndex:10];
        return 11;
    }
    return 10;
    /* }
    else
    {
        return supply.count;
    } */
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView* cell;
    /* if (tableView == table)
    { */
    Card* card = [cards cards][row];
        
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
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
    /* }
    else
    {
        NSDictionary* current = supply[row];
        NSString* key = [current allKeys][row];
        
        cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
        
        if ([tableColumn.identifier isEqualToString:@"cards"])
        {
            [cell.textField setStringValue:key];
        }
        else
        {
            [cell.textField setStringValue:[current valueForKey:key]];
        }
    } */
    
    return cell;
}

@end
