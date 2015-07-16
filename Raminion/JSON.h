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
    NSMutableArray* json;
}

- (void)createJSON:(NSString*)f;

- (NSMutableArray*)getJSON;

@end
