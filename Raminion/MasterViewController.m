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
@synthesize limit, table, setup;

Rules* rules;
Card *bane;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    setup = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
    [self addChildViewController:setup];
    [self.view addSubview:setup.view];
}

- (IBAction)shuffle:(id)sender
{
    cards = [[NSMutableArray alloc] init];
    Shuffle* shuffle = [[Shuffle alloc] init];
    JSON* json = [[JSON alloc] initWithFile:@"dominion"];
    rules = [[Rules alloc] init];
    
    int max = limit.stringValue.intValue;
    
    if (max != 0) {
        cards = [shuffle shuffle:[json supply] limit:max];
    }
    else
    {
        cards = [shuffle shuffle:[json supply]];
    }
    
    table.delegate = self;
    table.dataSource = self;
    
    [table reloadData];
    
    [setup required:[rules colony:cards] potion:[rules potion:cards]];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    bane = [rules bane:cards];
    
    if (bane != nil)
    {
        int index = [cards indexOfObject:bane];
        [cards exchangeObjectAtIndex:index withObjectAtIndex:10];
        return 11;
    }
    return 10;
}

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
