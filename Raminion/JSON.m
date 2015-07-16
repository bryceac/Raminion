//
//  JSON.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import "JSON.h"

@implementation JSON

- (id) init
{
    return [self initWithFile:nil];
}

- (id) initWithFile:(NSString*)f
{
    if (self = [super init])
    {
        [self createJSON:f];
    }
    return self;
}

- (void)createJSON:(NSString *)f
{
    
}

- (NSMutableArray*)json
{
    return json;
}

@end
