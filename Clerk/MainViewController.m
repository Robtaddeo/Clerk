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

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // TESTING TASKS & TABS
    Task *testTask = [[Task alloc] initWithValue: @"Testing New Task"
                                      setDueDate: [NSDate date]];
    
    Task *testTask2 = [[Task alloc] initWithValue: @"Testing New Task2"
    setDueDate: [NSDate date]];
    
    Tab *testTab = [[Tab alloc] initWithName: @"School"];
    [testTab addNewTask:testTask];
    [testTab addNewTask:testTask2];
    [testTab print];
    
    
    
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


@end
