//
//  Task.h
//  Clerk
//
//  Created by Robert Taddeo on 4/21/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab.h"

@interface Task: NSObject {
    int uid;
    NSString *value;
    BOOL complete;
    Tab *taskTab;
    
}

-(id) initWithValue: (NSString *) value
         setDueDate: (NSDate *) dueDate
             setTab: (Tab *) tab;

-(NSString *) getValue;

-(Tab *) getTab;
-(void) setTab: (Tab *) tab;

-(void) print;

@end
