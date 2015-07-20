//
//  JSON.h
//  Raminion
//
//  Created by Bryce Campbell on 7/16/15.
//  Copyright (c) 2015 Bryce Campbell.
//

#import <Foundation/Foundation.h>

@interface JSON : NSObject
{
    NSDictionary* json; // variable to hold JSON content;
    NSArray* supply; // variable that will hold the array that contains card info
}

- (id) initWithFile:(NSString*)f; // custom initializer to quickly create json from file and create the supply

- (void)createJSON:(NSString*)f; // method that make JSON readable to program

- (NSDictionary*)json; // method to retrieve JSON content directly

- (void) createSupply:(NSDictionary*)j; // method to populate array

- (NSArray*)supply; // method to retrieve array

@end
