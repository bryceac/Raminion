//
//  SetListController.h
//  Raminion
//
//  Created by Bryce Campbell on 7/19/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Sets.h"

@interface SetListController : NSViewController<NSTableViewDelegate, NSTableViewDataSource>
{
    Sets* sets;
}

@property (retain) Sets* sets;
@end
