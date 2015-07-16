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
    NSArray* json;
}

- (void)createJSON:(NSString*)f;

- (NSArray*)json;

@end
