//
//  Tab.h
//  Clerk
//
//  Created by Robert Taddeo on 4/21/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tab : NSObject {
    int uid;
    NSString *name;
    NSMutableArray *tasks;
    NSMutableArray *notes;
}

-(id) initWithName: (NSString *) name;

-(void) print;
-(void) addNewTask: (Task *) newTask;
-(NSString *) description;

@end

NS_ASSUME_NONNULL_END
