//
//  IndividualTaskViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 5/1/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "IndividualTaskViewController.h"

@interface IndividualTaskViewController ()
@end

static NSString *ShowCell = @"cell";
@implementation IndividualTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// Populates Table
-(void) setUser:(User *) currentUser {
    _currentUser = currentUser;
}

@end
