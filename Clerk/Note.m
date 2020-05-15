//
//  Notes.m
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "Note.h"

@implementation Note

-(id) init {
    if (self = [super init]){
        value = [NSString new];
        title = [NSString new];
    }
    return self;
}

// Inits Note with title
-(id) initWithTitle: (NSString *) title
           setValue: (NSString *) value {
    
    if (self = [super init]){
        self->title = title;
        self->value = value;
    }
    return self;
}

-(NSString *) getValue {
    return self->value;
}

-(void) setValue: (NSString *) newValue {
    self->value = newValue;
}

-(NSString *) getTitle {
    return self->title;
}

-(void) setTitle: (NSString *) newTitle {
    self->title = newTitle;
}

-(void) print{
    
    NSLog(@"Uid: %d", self->uid);
    NSLog(@"Title: %@", self->title);
    NSLog(@"Value: %@", self->value);
    
}

-(NSString *) description {
    return (@"Note");
}

@end
