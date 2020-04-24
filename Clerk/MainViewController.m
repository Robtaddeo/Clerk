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
    
    testTab = [[Tab alloc] initWithName: @"School"];
    
    
    for(int i = 0; i < 1000; i++){
        Task *newTask = [[Task alloc] initWithValue: [NSString stringWithFormat:@"Task %d", i]
                                         setDueDate: [NSDate date]];
        [testTab addNewTask:newTask];
    }
    
    // TESTING USERNAME - TODO ADD USER CLASS
    
    NSString *firstname = @"Robert";
    
    _welcomeLabel.text = [NSString stringWithFormat: @"Welcome, %@", firstname];
    [self setUpDateLabel];

    // Do any additional setup after loading the view.
    
}


// Populates Table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ShowCell
                             forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    Task *currTask = [testTab getTasksArray][indexPath.section];
    cell.textLabel.text = [currTask getValue]; // Title Text
    cell.textLabel.font = [UIFont fontWithDescriptor:[cell.textLabel.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold]
                                                size:25];
    cell.detailTextLabel.text = @"This is a test"; // Subtext
    cell.layer.cornerRadius = 10;
    
    // Random colors for now until we can get them connected to tabs
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    cell.backgroundColor = color;
    cell.textLabel.textColor = [UIColor whiteColor];
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

- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
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

@end

