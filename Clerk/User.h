//
//  User.h
//  Clerk
//
//  Created by Robert Taddeo on 4/22/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tab.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject {
    int uid;
    NSString *name;
    NSString *email;
    NSMutableArray *tabs;
    BOOL receiveNotifications;
    NSString *imgUrl;
}

-(id) initWithUid: (int) uid;

-(int) getUid;
-(void) setUid: (int) uid;

-(NSString *) getName;
-(void) setName: (NSString *) name;

-(NSMutableArray *) getTabs;
-(void) addTab:(Tab *) newTab;

-(BOOL) getRecieveNotifciations;
-(void) setRecieveNotifications: (BOOL) recieveNotification;

-(NSString *) getImgUrl;
-(void) setImgUrl: (NSString *) imgUrl;


@end

NS_ASSUME_NONNULL_END
