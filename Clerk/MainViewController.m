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
    NSMutableArray *testArray;
    Tab *testTab;
}
@end

static NSString *ShowCell = @"cell";

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // TESTING TASKS & TABS
    Task *testTask = [[Task alloc] initWithValue: @"Testing New Task"
                                      setDueDate: [NSDate date]];
    
    Task *testTask2 = [[Task alloc] initWithValue: @"Testing New Task2"
    setDueDate: [NSDate date]];
    testTab = [[Tab alloc] initWithName: @"School"];
    [testTab addNewTask:testTask];
    [testTab addNewTask:testTask2];
    
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
    
    [self testArraySetup];
    
    // Do any additional setup after loading the view.
}


-(void) testArraySetup {
    testArray = [NSMutableArray arrayWithArray: @[@"test1", @"test2", @"test3", @"test3"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [testArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ShowCell
                             forIndexPath:indexPath];
    
    ///////////// #7 display type of button on right
    ///////////// #7 display type of button on right
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    /////////////  #8 grab opera name and put it in the cell
    
    /////////////  #8 grab opera name and put it in the cell
     cell.textLabel.text = testArray[indexPath.row];
     
   
    
    return cell;
}


@end

