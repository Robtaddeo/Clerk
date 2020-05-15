//
//  AddTabViewController.h
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddTabViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *addTabButton;
@property (weak, nonatomic) IBOutlet UITextField *tabNameTextField;
@property (nonatomic, strong) User *currentUser;
@end

NS_ASSUME_NONNULL_END
