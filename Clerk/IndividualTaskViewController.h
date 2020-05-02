//
//  IndividualTaskViewController.h
//  Clerk
//
//  Created by Robert Taddeo on 5/1/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface IndividualTaskViewController : UIViewController

@property (copy, nonatomic) User *currentUser;
@property (strong, nonatomic) IBOutlet UIView *taskValue;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDatePicker;
-(void) setUser:(User *) currentUser;

@end

NS_ASSUME_NONNULL_END
