//
//  User.m
//  Clerk
//
//  Created by Robert Taddeo on 4/22/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "User.h"

@implementation User

-(id) initWithUid:(int)uid {
    // Todo grab stuff from firebase and populate rest of fields
    return self;
}

-(int) getUid {
    return uid;
}

-(void) setUid: (int) uid {
    self->uid = uid;
}

-(NSString *) getName {
    return name;
}

-(void) setName: (NSString *) name {
    self->name = name;
}

-(NSMutableArray *) getTabs {
    return tabs;
}
-(void) addTab:(Tab *) newTab {
    [tabs addObject:newTab];
}

-(BOOL) getRecieveNotifciations {
    return receiveNotifications;
}

-(void) setRecieveNotifications: (BOOL) recieveNotification {
    self->receiveNotifications = recieveNotification;
}

-(NSString *) getImgUrl {
    return imgUrl;
}

-(void) setImgUrl: (NSString *) imgUrl {
    self->imgUrl = imgUrl;
}


@end
