//
//  Tab.m
//  Clerk
//
//  Created by Robert Taddeo on 4/21/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "Tab.h"
#import "Task.h"

@implementation Tab

-(id) initWithName: (NSString *) name {

    if (self = [super init]){
        self->name = name;
        notes = [[NSMutableArray alloc] init];
    }
    return self;
}

-(int) getUid {
    return self->uid;
}

-(void) setUid:(int)uid {
    self->uid = uid;
}

-(NSString *) getName {
    return self->name;
}

-(void) setName:(NSString *)name {
    self->name = name;
}

-(UIColor *) getColor {
    return self->tabColor;
}

-(void) setColor:(UIColor *)color {
    self->tabColor = color;
}

-(NSMutableArray *) getNotes {
    return notes;
}
-(NSInteger) getNoteCount {
    return [notes count];
}
-(void) addNote:(Note *) newNote {
    [notes insertObject:newNote atIndex:0];
}

-(void) deleteNote:(int) index {
    [notes removeObjectAtIndex:index];
}

-(void) print{
    NSLog(@"Tab Name: %@\n", self->name);
}

-(NSString *) description {
    return (@"Tab");
}

@end
