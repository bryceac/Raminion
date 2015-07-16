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
    NSString* path = [[NSBundle mainBundle] pathForResource:f ofType:@"json"];
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSData* data = [content dataUsingEncoding:NSUTF8StringEncoding];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

- (NSMutableArray*)json
{
    return json;
}

@end
