//
//  User.h
//  Clerk
//
//  Created by Robert Taddeo on 4/22/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tab.h"
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject {
    int uid;
    NSString *name;
    NSString *email;
    NSMutableArray *tabs;
    NSMutableArray *tasks;
    BOOL receiveNotifications;
    NSString *imgUrl;
}

-(id) initWithUid: (int) uid
          andName: (NSString *) name
         andEmail: (NSString *) email
        andImgUrl: (NSString *) imgUrl
 andNotifications: (BOOL) receiveNotifications;

-(int) getUid;
-(void) setUid: (int) uid;

-(NSString *) getName;
-(void) setName: (NSString *) name;
-(NSString *) getFirstName;
-(NSString *) getLastName;

-(NSMutableArray *) getTabs;
-(void) addTab:(Tab *) newTab;
-(NSInteger) getTabCount;

-(NSMutableArray *) getTasks;
-(NSInteger) getTaskCount;
-(void) addTask:(Task *) newTask;


-(BOOL) getRecieveNotifciations;
-(void) setRecieveNotifications: (BOOL) recieveNotification;

-(NSString *) getImgUrl;
-(void) setImgUrl: (NSString *) imgUrl;


@end

NS_ASSUME_NONNULL_END
