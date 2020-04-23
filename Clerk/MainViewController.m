//
//  ViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 4/15/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "MainViewController.h"
#import "Task.h"
#import "Tab.h"

@interface MainViewController () {
    Tab *testTab;
}
@end

static NSString *ShowCell = @"cell";

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // TESTING TASKS & TABS
    Task *testTask = [[Task alloc] initWithValue: @"Task 1"
                                      setDueDate: [NSDate date]];
    
    Task *testTask2 = [[Task alloc] initWithValue: @"Task 2"
                                       setDueDate: [NSDate date]];
    
    Task *testTask3 = [[Task alloc] initWithValue: @"Task 3"
                                      setDueDate: [NSDate date]];
    
    Task *testTask4 = [[Task alloc] initWithValue: @"Task 4"
                                       setDueDate: [NSDate date]];
    
    testTab = [[Tab alloc] initWithName: @"School"];
    [testTab addNewTask:testTask];
    [testTab addNewTask:testTask2];
    [testTab addNewTask:testTask3];
    [testTab addNewTask:testTask4];
    
    // TESTING USERNAME - TODO ADD USER CLASS
    
    NSString *firstname = @"Robert";
    
    _welcomeLabel.text = [NSString stringWithFormat: @"Welcome, %@", firstname];
    
    
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
    // Do any additional setup after loading the view.
    
}


// Populates Table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ShowCell
                             forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
//    NSLog(@"indexPath.row: %d\n", (long) indexPath.row);
    Task *currTask = [testTab getTasksArray][indexPath.section];
    cell.textLabel.text = [currTask getValue];
    cell.layer.cornerRadius = 10;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [testTab getTasksCount];
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

@end

