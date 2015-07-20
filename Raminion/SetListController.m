//
//  SetListController.m
//  Raminion
//
//  Created by Bryce Campbell on 7/19/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "SetListController.h"

@interface SetListController ()

@end

@implementation SetListController
@synthesize sets, groups;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)retrieve:(NSArray *)s
{
    sets = [[Sets alloc] initWithArray:s]; // create sets object
    
    // populate table
    groups.delegate = self;
    groups.dataSource = self;
    
    [groups reloadData];
}

// the following methods work the same as the MasterViewController table, but with data meant for setup
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [[sets sets] count];
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSMutableArray* collections = [[NSMutableArray alloc] initWithArray:[[sets sets] array]];
    NSTableCellView* cell;
    
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    [cell.textField setStringValue:collections[row]];
    return cell;
}

@end
