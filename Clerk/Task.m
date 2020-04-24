//
//  Task.m
//  Clerk
//
//  Created by Robert Taddeo on 4/21/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "Task.h"

@implementation Task

-(id) init {
    if (self = [super init]){
        value = [NSString new];
//        dueDate = [NSDate new];
//        postDate = [NSDate new];
        complete = NO;
    }
    return self;
}

-(id) initWithValue: (NSString *) value
setDueDate: (NSDate *) dueDate {
    
    if (self = [super init]){
        self->value = value;
//        self->dueDate = dueDate;
//        self.postDate = [[NSDate date] descriptionWithLocale:currentLocale];
    }
    return self;
}

-(NSString *) getValue {
    return self->value;
}

-(void) print{
    
    NSLog(@"Uid: %d", self->uid);
    NSLog(@"Value: %@", self->value);
//    NSString *dateString = [NSDateFormatter localizedStringFromDate:self->dueDate;
//    dateStyle:NSDateFormatterShortStyle
//    timeStyle:NSDateFormatterFullStyle];
//    NSLog(@"%@",dateString);
    
}

-(NSString *) description {
    return (@"Task");
}

@end
