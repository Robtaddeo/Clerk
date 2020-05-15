//
//  IndividualTabViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 5/1/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "IndividualTabViewController.h"
#import "TaskContainerViewController.h"
#import "NotesContainerViewController.h"

@interface IndividualTabViewController ()

@end

@implementation IndividualTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _tabTitle;
    [_notesView setHidden:YES];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"taskEmbedSegue"]) {
        TaskContainerViewController *embed = segue.destinationViewController;
        embed.currentUser = _currentUser;
        embed.currenTab = _currentTab;
    }
    if ([[segue identifier] isEqualToString:@"notesEmbedSegue"]) {
        NotesContainerViewController *embed = segue.destinationViewController;
        embed.currentUser = _currentUser;
        embed.currenTab = _currentTab;
    }
}

-(void) setUser:(User *) currentUser {
    _currentUser = currentUser;
}

- (IBAction)changeView:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;

    if (selectedSegment == 0) {
      //toggle the correct view to be visible
      [_tasksView setHidden:NO];
      [_notesView setHidden:YES];
    }
    else{
      //toggle the correct view to be visible
      [_tasksView setHidden:YES];
      [_notesView setHidden:NO];
    }
}

@end
