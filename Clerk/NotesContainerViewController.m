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
#import "ShowNoteViewController.h"

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateNote:)
                                                 name:@"updateNote"
                                               object: nil];
    // Do any additional setup after loading the view.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // New Note Segue
    
    if ([[segue identifier] isEqualToString:@"newNoteSegue"]) {
        newNoteContainerViewController *vc = segue.destinationViewController;
        vc.currentTab = _currenTab;
    }
    
    
    // Show note Segue
    
    if ([[segue identifier] isEqualToString:@"showNoteSegue"]) {
        
        NSInteger selectedRow = [_notesTable indexPathForSelectedRow].section;
        ShowNoteViewController *vc = [segue destinationViewController];
        NSMutableArray *notes = [_currenTab getNotes];
        Note *currentNote = notes[selectedRow];
        [vc setIndex:(int) selectedRow];
        vc.bodyText = [currentNote getValue];
        vc.titleText = [currentNote getTitle];
        
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:ShowCell
                             forIndexPath:indexPath];
    
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

// Updating View Controller after new Data

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
      [[_currenTab getNotes] removeObjectAtIndex:indexPath.row];
      [tableView reloadData];
  }
}

-(void)updateView:(NSNotification *)notification {
    [self viewDidLoad];
    [_notesTable reloadData];
}

// Updates Current User with new Tab ;)
// TODO: Be able to update notes
-(void)updateNote:(NSNotification *)notification {
//    NSDictionary *dict = notification.userInfo;
//    int index = (int) [dict valueForKey:@"index"];
//    Note *newNote = [dict valueForKey:@"note"];
//    NSString* name = [newNote getTitle];
////    [[_currenTab getNotes][index] setTitle:name];
//    [_notesTable reloadData];
}
@end
