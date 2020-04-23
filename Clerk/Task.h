//
//  Task.h
//  Clerk
//
//  Created by Robert Taddeo on 4/21/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Task: NSObject {
    int uid;
    NSString *value;
    BOOL complete;
    
}

-(id) initWithValue: (NSString *) value
         setDueDate: (NSDate *) dueDate;

//testing tej push

//-(void)setPosition: (int) newPosition;
//
//-(int) position;
//
//-(void)setMidterm: (int) newMidterm;
//
//-(int) midterm;
//
//-(void)setFinal: (int) newFinal;
//
//-(int) final;
//
//-(void)setName: (NSString *) newName;
//
//-(NSString *) name;
//
//-(void)setAddress: (NSString *) newAddress;
//
//-(NSString *) address;
//
//-(void)setImage: (NSString *) newImage;
//
//-(NSString *) image;
//
//-(void) setHw: (int) newHw
//      atIndex: (int) index;
//
//-(int) hwAtIndex: (int) index;
//
-(void) print;

@end
