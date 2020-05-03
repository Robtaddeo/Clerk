//
//  TaskContainerViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "TaskContainerViewController.h"
#import "Task.h"

@interface TaskContainerViewController ()

@end
static NSString *ShowCell = @"cell";
NSMutableArray * myTasks;

@implementation TaskContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myTasks = [[NSMutableArray alloc] init];
    
    // Dismissing Text Field
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
    
    _taskAddButton.layer.cornerRadius = 5;
    
    // Filtering Tasks
    
    for(int i = 0; i < [_currentUser getTaskCount]; i++){
        Task *currentTask = [_currentUser getTasks][i];
        
        if([[[currentTask getTab] getName] isEqual: [_currenTab getName]]){
            [myTasks addObject: currentTask];
        }
    }
    
//    NSLog([NSString stringWithFormat:@"Name: %@", [_currentUser getName]]);
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ShowCell
                             forIndexPath:indexPath];
    
   
    Task *currTask = myTasks[indexPath.section];
    cell.textLabel.text = [currTask getValue]; // Title Text
    cell.textLabel.font = [UIFont fontWithDescriptor:[cell.textLabel.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold]
                                                size:25];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ | Due %@", [[currTask getTab] getName], [currTask getDueDateString]]; // Subtext
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
      [_taskTable reloadData];
      
  }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [myTasks count];
}
//
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

-(void) addNewTask:(NSString *)name atDate:(NSDate *) date {
    
    Task *newTask = [[Task alloc]initWithValue:name setDueDate:date setTab:_currenTab];
//    NSLog(@"%@", [NSString stringWithFormat:@"Count: %ld", (long)[_currentUser getTaskCount]]);
    [_currentUser addTask:newTask];
//    NSLog(@"%@", [NSString stringWithFormat:@"Count: %ld", (long)[_currentUser getTaskCount]]);
    
    [self viewDidLoad];
    [_taskTable reloadData];
}

- (IBAction)addNewTaskEvent:(id)sender {
    if(_taskValue.text.length > 0){
        [self addNewTask:[_taskValue text] atDate:[_taskDate date]];
    }
    [_taskValue setText:@""];
}

// Dismiss Keyboard Function
- (void)dismissKeyboard
{
     [_taskValue resignFirstResponder];
}

-(void) setUser:(User *) currentUser {
    _currentUser = currentUser;
}

// TODO: Figure out how tf to close keyboard on anykey press

@end
