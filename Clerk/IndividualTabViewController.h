//
//  IndividualTabViewController.h
//  Clerk
//
//  Created by Robert Taddeo on 5/1/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Tab.h"

NS_ASSUME_NONNULL_BEGIN

@interface IndividualTabViewController : UIViewController

@property (nonatomic, strong) User *currentUser;
@property (nonatomic, strong) Tab *currentTab;
@property (nonatomic, weak) NSString *tabTitle;


-(void) setUser:(User *) currentUser;

@property (weak, nonatomic) IBOutlet UIView *notesView;
@property (weak, nonatomic) IBOutlet UIView *tasksView;

@end

NS_ASSUME_NONNULL_END
