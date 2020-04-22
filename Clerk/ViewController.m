//
//  ViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 4/15/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"
#import "Tab.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Task *testTask = [[Task alloc] initWithValue: @"Testing New Task"
                                      setDueDate: [NSDate date]];
    
    Tab *testTab = [[Tab alloc] initWithName: @"School"];
    [testTab addNewTask:testTask];
    [testTab print];
    
    // Do any additional setup after loading the view.
}


@end
