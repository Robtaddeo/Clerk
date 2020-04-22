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

NSMutableArray *tasksArray;
NSMutableArray *notesArray;

-(id) initWithName: (NSString *) name {

    if (self = [super init]){
        self->name = name;
    }
    return self;
}

-(void) addNewTask: (Task *) newTask {
    [tasksArray addObject:newTask];
}

-(void) print{
    NSLog(@"Tab Name: %@\n", self->name);
    NSLog(@"Task count : %d\n", (int) [tasksArray count]);
    for (int i = 0; i < [tasksArray count]; i++) {
        Task *currTask = tasksArray[i];
        [currTask print];
    }
}

-(NSString *) description {
    return (@"Tab");
}

@end
