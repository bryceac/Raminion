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
        json = [[NSDictionary alloc] init];
        supply = [[NSArray alloc] init];
        [self createJSON:f];
    }
    return self;
}

- (void)createJSON:(NSString *)f
{
    NSString* path = [[NSBundle mainBundle] pathForResource:f ofType:@"json"];
    
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    json = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    [self createSupply:json];
}

- (NSDictionary*)json
{
    return json;
}

- (void)createSupply:(NSDictionary *)j
{
    supply = [j objectForKey:@"cards"];
}

- (NSArray*)supply
{
    return supply;
}

@end
