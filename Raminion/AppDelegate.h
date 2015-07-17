//
//  AppDelegate.h
//  Raminion
//
//  Created by Bryce Campbell on 7/15/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MasterViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    MasterViewController* masterView;
}

@property(strong) MasterViewController* masterView;


@end

