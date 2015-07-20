//
//  SetupViewController.m
//  Raminion
//
//  Created by Bryce Campbell on 7/18/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import "SetupViewController.h"

@interface SetupViewController ()

@end

@implementation SetupViewController
@synthesize setup;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

// the required method determines cards needed. Boolean variables are passed to make that determination
- (void)required:(BOOL)c potion:(BOOL)p ruins:(BOOL)r shelter:(BOOL)s spoils:(BOOL)t
{
    supply = [[NSMutableArray alloc] init]; // initialize array, in order to use it
    
    // check if for cards needed for setup
    if (c == true)
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Colony & Platinum"];
        [supply addObject:item];
    }
    else
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:0] forKey:@"Colony & Platinum"];
        [supply addObject:item];
    }
    
    if (p == true)
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Potion"];
        [supply addObject:item];
    }
    else
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:0] forKey:@"Potion"];
        [supply addObject:item];
    }
    
    if (r == true)
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Ruins"];
        [supply addObject:item];
    }
    else
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:0] forKey:@"Ruins"];
        [supply addObject:item];
    }
    
    if (s == true)
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Shelters"];
        [supply addObject:item];
    }
    else
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:0] forKey:@"Shelters"];
        [supply addObject:item];
    }
    
    if (t == true)
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:1] forKey:@"Spoils"];
        [supply addObject:item];
    }
    else
    {
        NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
        [item setObject:[NSNumber numberWithInt:0] forKey:@"Spoils"];
        [supply addObject:item];
    }
    
    // assign delegate and dataSource to table
    setup.delegate = self;
    setup.dataSource = self;
    
    [setup reloadData]; // refresh table, in order to populate it
}

// the following methods work the same as the MasterViewController table, but with data meant for setup
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
     return [supply count];
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView* cell;
    
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    NSDictionary* current = supply[row];
    NSString* key = [current allKeys][0]; // get the key of the current dictionary must be 0, as there is only one key
    int value = [[current valueForKey:key] integerValue]; // variable to hold key value
     
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
     
    if ([tableColumn.identifier isEqualToString:@"cards"])
    {
        [cell.textField setStringValue:key];
    }
    else
    {
        if (value > 0) {
            [cell.textField setStringValue:@"Yes"];
        }
        else
        {
            [cell.textField setStringValue:@"No"];
        }
    }

    
    return cell;
}

@end
