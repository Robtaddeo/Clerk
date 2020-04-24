//
//  User.m
//  Clerk
//
//  Created by Robert Taddeo on 4/22/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "User.h"

@implementation User

-(id) initWithUid: (int) uid
         andName: (NSString *) name
        andEmail: (NSString *) email
       andImgUrl: (NSString *) imgUrl
andNotifications: (BOOL) receiveNotifications {
    
    if (self = [super init]){
        self->uid = uid;
        self->name = name;
        self->email = email;
        self->imgUrl = imgUrl;
        self->receiveNotifications = receiveNotifications;
        self->tabs = [[NSMutableArray alloc] init];
        self->tasks = [[NSMutableArray alloc] init];
    }
    
    return self;

}

// uid stuff

-(int) getUid {
    return uid;
}

-(void) setUid: (int) uid {
    self->uid = uid;
}

// Name Stuff

-(NSString *) getName {
    return name;
}

-(void) setName: (NSString *) name {
    self->name = name;
}

-(NSString *) getFirstName {
    NSArray *array = [name componentsSeparatedByString:@" "];
    return array[0];
}

-(NSString *) getLastName {
    NSArray *array = [name componentsSeparatedByString:@" "];
    return array[1];
}

// Tabs Array Stuff

-(NSMutableArray *) getTabs {
    return tabs;
}
-(void) addTab:(Tab *) newTab {
    [tabs addObject:newTab];
}
-(NSInteger) getTabCount {
    return [tabs count];
}

// Tasks Array Stuff

-(NSMutableArray *) getTasks {
    return tasks;
}

-(NSInteger) getTaskCount {
    return [tasks count];
}

-(void) addTask:(Task *)newTask {
    [tasks addObject:newTask];
}

// Setting Notifications ?

-(BOOL) getRecieveNotifciations {
    return receiveNotifications;
}

-(void) setRecieveNotifications: (BOOL) recieveNotification {
    self->receiveNotifications = recieveNotification;
}

// IMG URL Stuff

-(NSString *) getImgUrl {
    return imgUrl;
}

-(void) setImgUrl: (NSString *) imgUrl {
    self->imgUrl = imgUrl;
}


@end
