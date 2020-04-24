//
//  FastSegue.m
//  Clerk
//
//  Created by Robert Taddeo on 4/24/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "FastSegue.h"

@implementation FastSegue

    - (void) perform {
        [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
    }

@end
