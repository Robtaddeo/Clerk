//
//  NotesContainerViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "NotesContainerViewController.h"
#import "Note.h"
#import "NewNoteContainerViewController.h"

@interface NotesContainerViewController ()

@end

@implementation NotesContainerViewController
static NSString *ShowCell = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _noteButton.layer.cornerRadius = 5;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateView:)
                                                 name:@"addNote" object:nil];
    // Do any additional setup after loading the view.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"newNoteSegue"]) {
        newNoteContainerViewController *vc = segue.destinationViewController;
        vc.currentTab = _currenTab;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ShowCell
                             forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    Note *currNote = [_currenTab getNotes][indexPath.section];
    cell.textLabel.text = [currNote getTitle]; // Title Text
    cell.textLabel.font = [UIFont fontWithDescriptor:[cell.textLabel.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold]
                                                size:25];
    
    cell.layer.cornerRadius = 10;
    
    cell.backgroundColor = [_currenTab getColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_currenTab getNotes] count];
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

// Updating View Controller after new Data





-(void)updateView:(NSNotification *)notification {
    [self viewDidLoad];
    [_notesTable reloadData];
}

@end
