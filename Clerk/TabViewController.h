//
//  TabViewController.h
//  Clerk
//
//  Created by Robert Taddeo on 4/24/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
//#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tabsTable;

@end

NS_ASSUME_NONNULL_END
