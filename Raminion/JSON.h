//
//  JSON.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSON : NSObject
{
    NSDictionary* json;
    NSArray* supply;
}

- (id) initWithFile:(NSString*)f;

- (void)createJSON:(NSString*)f;

- (NSDictionary*)json;

- (void) createSupply:(NSDictionary*)j;

- (NSArray*)supply;

@end
