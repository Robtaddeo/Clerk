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
         setDueDate: (NSDate *) dueDate
             setTab:(Tab *)tab {
    
    if (self = [super init]){
        self->value = value;
        self->taskTab = tab;
        self->dueDate = dueDate;
//        self.postDate = [[NSDate date] descriptionWithLocale:currentLocale];
    }
    return self;
}

-(NSString *) getValue {
    return self->value;
}

-(Tab *) getTab {
    return self->taskTab;
}

-(void) setTab:(Tab *)tab {
    self->taskTab = tab;
}

-(NSString *)getDueDateString {
     
     // Date Label
     NSDate *date = self->dueDate;
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     
     // Getting day of week
     [dateFormatter setDateFormat:@"EEEE"];
     NSString *dayOfWeek = [dateFormatter stringFromDate:date];
     
     // Getting Month
     [dateFormatter setDateFormat:@"MMMM"];
     NSString *month = [dateFormatter stringFromDate:date];
     
     // Getting Day
     [dateFormatter setDateFormat:@"dd"];
     NSString *day = [dateFormatter stringFromDate:date];
     return [NSString stringWithFormat: @"%@, %@ %@", dayOfWeek, month, day];
    
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
