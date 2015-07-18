//
//  SetupViewController.m
//  Raminion
//
//  Created by Bryce Campbell on 7/18/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()

@end

@implementation SetupViewController
@synthesize setup;

NSMutableArray* supply;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)required:(BOOL)c potion:(BOOL)p
{
    supply = [[NSMutableArray alloc] init];
    if (c && p)
     {
     NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
     [item setObject:[NSNumber numberWithInt:1] forKey:@"Potion"];
     [supply addObject:item];
     [item removeObjectForKey:@"Potion"];
     [item setObject:[NSNumber numberWithInt:1] forKey:@"Colony & Platinum"];
     [supply addObject:item];
     
     }
     if (c)
     {
     NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
     [item setObject:[NSNumber numberWithInt:0] forKey:@"Potion"];
     [supply addObject:item];
     [item removeObjectForKey:@"Potion"];
     [item setObject:[NSNumber numberWithInt:1] forKey:@"Colony & Platinum"];
     [supply addObject:item];
     
     }
     if (p)
     {
     NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
     [item setObject:[NSNumber numberWithInt:1] forKey:@"Potion"];
     [supply addObject:item];
     [item removeObjectForKey:@"Potion"];
     [item setObject:[NSNumber numberWithInt:0] forKey:@"Colony & Platinum"];
     [supply addObject:item];
     
     }
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
     return supply.count;
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView* cell;
    
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
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
    
    return cell;
}

@end
