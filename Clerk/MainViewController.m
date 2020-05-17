//
//  ViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 4/15/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "MainViewController.h"
#import "Task.h"
#import "User.h"
#import "Tab.h"
#import "TabViewController.h"

@interface MainViewController ()
@end

static NSString *ShowCell = @"cell";

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Setting Nav Bar Image, also setting colors and removing border
    self.navigationItem.title = [NSString stringWithFormat: @"Welcome, %@", [_currentUser getFirstName]];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    
    

    
    // TODO: Figure out how to set status bar to black
    
    
    // Setting up Swipes
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];

    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];

    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    
    // TESTING TASKS & TABS
    
    // Sets up greeting and date labels
    if([_currentUser getTaskCount] != 0){
        _noTasksLabel.hidden = YES;
    }
    [self setUpDateLabel];

    // Do any additional setup after loading the view.
    
}


// Populates Table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ShowCell
                             forIndexPath:indexPath];
    
    Task *currTask = [_currentUser getTasks][indexPath.section];
    cell.textLabel.text = [currTask getValue]; // Title Text
    cell.textLabel.font = [UIFont fontWithDescriptor:[cell.textLabel.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold]
                                                size:25];
    
    cell.detailTextLabel.text = cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ | Due %@", [[currTask getTab] getName], [currTask getDueDateString]]; // Subtext
    cell.layer.cornerRadius = 10;
    
    cell.backgroundColor = [[currTask getTab] getColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
      [[_currentUser getTasks] removeObjectAtIndex:indexPath.row];
      [self viewDidLoad];
      [tableView reloadData];
      
  }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_currentUser getTaskCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"button clicked?\n");
}

// Calculates Date String and inputs into date Label

-(void)setUpDateLabel {
     
     // Date Label
     NSDate *today = [NSDate date]; // Today's Date
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     
     // Getting day of week
     [dateFormatter setDateFormat:@"EEEE"];
     NSString *dayOfWeek = [dateFormatter stringFromDate:today];
     
     // Getting Month
     [dateFormatter setDateFormat:@"MMMM"];
     NSString *month = [dateFormatter stringFromDate:today];
     
     // Getting Day
     [dateFormatter setDateFormat:@"dd"];
     NSString *day = [dateFormatter stringFromDate:today];
    _dateLabel.text = [NSString stringWithFormat: @"%@, %@ %@", dayOfWeek, month, day];
    
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        [self performSegueWithIdentifier:@"swipeSettingsPage" sender:nil];
    }

}

-(void) setUser:(User *) currentUser {
    _currentUser = currentUser;
}




@end

