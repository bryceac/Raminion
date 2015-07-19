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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)required:(BOOL)c potion:(BOOL)p
{
    supply = [[NSMutableArray alloc] init];
    
    if (c == true && p == true)
     {
         NSMutableDictionary *item = [[NSMutableDictionary alloc] init];
         [item setObject:[NSNumber numberWithInt:1] forKey:@"Potion"];
         [supply addObject:item];
         [item removeObjectForKey:@"Potion"];
         [item setObject:[NSNumber numberWithInt:1] forKey:@"Colony & Platinum"];
         [supply addObject:item];
     }
    
     else if (c == true && p == false)
     {
         NSMutableDictionary *potion = [[NSMutableDictionary alloc] init];
         [potion setObject:[NSNumber numberWithInt:0] forKey:@"Potion"];
         [supply addObject:potion];
         NSMutableDictionary *colony = [[NSMutableDictionary alloc] init];
         [colony setObject:[NSNumber numberWithInt:1] forKey:@"Colony & Platinum"];
         [supply addObject:colony];
     }
    
     else if (c == false && p == true)
     {
         NSMutableDictionary *potion = [[NSMutableDictionary alloc] init];
         [potion setObject:[NSNumber numberWithInt:1] forKey:@"Potion"];
         [supply addObject:potion];
         NSMutableDictionary *colony = [[NSMutableDictionary alloc] init];
         [colony setObject:[NSNumber numberWithInt:0] forKey:@"Colony & Platinum"];
         [supply addObject:colony];
     }
    else
    {
        NSMutableDictionary *potion = [[NSMutableDictionary alloc] init];
        [potion setObject:[NSNumber numberWithInt:0] forKey:@"Potion"];
        [supply addObject:potion];
        NSMutableDictionary *colony = [[NSMutableDictionary alloc] init];
        [colony setObject:[NSNumber numberWithInt:0] forKey:@"Colony & Platinum"];
        [supply addObject:colony];
    }
    
    setup.delegate = self;
    setup.dataSource = self;
    
    [setup reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
     return [supply count];
}

- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView* cell;
    
    cell = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    NSDictionary* current = supply[row];
    NSString* key = [current allKeys][row];
    int value = [[current valueForKey:key] integerValue];
     
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
