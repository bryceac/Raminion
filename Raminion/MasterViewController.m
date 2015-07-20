//
//  MasterViewController.m
//  Raminion
//
//  Created by Bryce Campbell on 7/15/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "MasterViewController.h"
#import "Card.h"
#import "Rules.h"
#import "Shuffle.h"
#import "JSON.h"

@implementation MasterViewController
@synthesize limit, table, sets, setup;

Rules* rules; // variable used to determine what is needed each game
Card *bane; // variable to hold the bane card, if it is needed
JSON* json; // variable that will hold json object

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    // add child view controllers
    setup = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
    [self addChildViewController:setup];
    [self.view addSubview:setup.view];
    
    sets = [[SetListController alloc] initWithNibName:@"SetListController" bundle:nil];
    [self addChildViewController:sets];
    [self.view addSubview:sets.view];
    
    json = [[JSON alloc] initWithFile:@"dominion"]; // initial json object with the file that contains card info
    [sets retrieve:[json supply]];
}

- (IBAction)shuffle:(id)sender
{
    cards = [[NSMutableArray alloc] init]; // array used to populate main table
    Shuffle* shuffle = [[Shuffle alloc] init]; // object used for shuffling cards
    rules = [[Rules alloc] init]; // create rules object, so that game needs can be implemented
    NSIndexSet* selected = [sets.groups selectedRowIndexes];
    
    if ([selected count] > 0) {
        NSMutableArray* collection = [[NSMutableArray alloc] initWithArray:[[sets.sets sets] array]];
        
        NSMutableArray* chosen = [[NSMutableArray alloc] init];
        
        NSUInteger index = [selected firstIndex];
        
        while (index != NSNotFound)
        {
            [chosen addObject:collection[index]];
            
            index = [selected indexGreaterThanIndex:index];
        }
    }
    
    // retrieve max number of sets that the user wants to have.
    int max = limit.stringValue.intValue;
    
    // if user specified a max amount of sets, shuffle cards only belonging that that specified amount of sets
    if (max != 0) {
        cards = [shuffle shuffle:[json supply] limit:max];
    }
    else
    {
        cards = [shuffle shuffle:[json supply]];
    }
    
    // specify table delegate and dataSource
    table.delegate = self;
    table.dataSource = self;
    
    [table reloadData]; // refresh table so that content will appear
    
    [setup required:[rules colony:cards] potion:[rules potion:cards]]; // make sure that setup table is populated
}

// numberofRowsInTableView specifies the number of rows that will appear
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    bane = [rules bane:cards]; // retrieve Bane card
    
    // if there is a Bane, make sure it is the 11th item and that there are 11 rows, otherwise return only ten rows
    if (bane != nil)
    {
        int index = [cards indexOfObject:bane];
        [cards exchangeObjectAtIndex:index withObjectAtIndex:10];
        return 11;
    }
    return 10;
}

// the following method is needed to populate an NSTableView
- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView* cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    Card* card = cards[row];
        
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
