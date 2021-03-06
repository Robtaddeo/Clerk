//
//  Tab.h
//  Clerk
//
//  Created by Robert Taddeo on 4/21/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN



@interface Tab : NSObject {
    int uid;
    NSString *name;
    UIColor *tabColor;
    NSMutableArray *notes;
}

-(id) initWithName: (NSString *) name;

-(int) getUid;
-(void) setUid: (int) uid;

-(NSString *)getName;
-(void) setName: (NSString *) name;

-(UIColor *) getColor;
-(void)setColor: (UIColor *) color;

-(NSMutableArray *) getNotes;
-(NSInteger) getNoteCount;
-(void) addNote:(Note *) newNote;
-(void) deleteNote:(int) index;

-(void) print;
-(NSString *) description;


@end

NS_ASSUME_NONNULL_END
