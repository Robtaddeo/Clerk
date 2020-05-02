//
//  Notes.h
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Note: NSObject {
    int uid;
    NSString *title;
    NSString *value;
    
}

-(id) initWithTitle: (NSString *) title
           setValue: (NSString *) value;

-(NSString *) getTitle;
-(NSString *) getValue;

-(void) print;

@end
