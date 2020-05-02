//
//  NotesContainerViewController.h
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Tab.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotesContainerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) User *currentUser;
@property (nonatomic, strong) Tab *currenTab;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@property (weak, nonatomic) IBOutlet UITableView *notesTable;

@property (weak, nonatomic) IBOutlet UIButton *noteButton;

@end

NS_ASSUME_NONNULL_END
