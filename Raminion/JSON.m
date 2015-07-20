//
//  JSON.m
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import "JSON.h"

@implementation JSON

// default initializer
- (id) init
{
    return [self initWithFile:nil];
}

// main initializer
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
    NSString* path = [[NSBundle mainBundle] pathForResource:f ofType:@"json"]; // retrieve location of JSON file
    
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]; // get file contents
    
    json = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil]; // convert file contents to dictionary
    
    [self createSupply:json]; // create array from file content
}

- (NSDictionary*)json
{
    return json;
}

- (void)createSupply:(NSDictionary *)j
{
    supply = [j objectForKey:@"cards"]; // look for key called cards and assign it to the array variable
}

- (NSArray*)supply
{
    return supply;
}

@end
