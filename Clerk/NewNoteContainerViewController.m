//
//  newNoteContainerViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "NewNoteContainerViewController.h"
#import "Note.h"
#import "AppDelegate.h"

@interface newNoteContainerViewController ()

@end

@implementation newNoteContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_titleTextView setFont:[UIFont boldSystemFontOfSize:30]];
    _titleTextView.text = @"Enter Your Title";
    _titleTextView.textColor = [UIColor lightGrayColor];
    
    // Removing Keyboard
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
    
    
    
    // Do any additional setup after loading the view.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView {
    _titleTextView.text = @"";
    _titleTextView.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView {

    if(_titleTextView.text.length == 0) {
        _titleTextView.textColor = [UIColor lightGrayColor];
        _titleTextView.text = @"Enter Your Title";
        [_titleTextView resignFirstResponder];
    }
}

-(void) textViewShouldEndEditing:(UITextView *)textView {

    if(_titleTextView.text.length == 0) {
        _titleTextView.textColor = [UIColor lightGrayColor];
        _titleTextView.text = @"Enter Your Title";
        [_titleTextView resignFirstResponder];
    }
}

- (IBAction)addNewNoteButtonEvent:(id)sender {
    
    if(_titleTextView.text.length != 0 && _bodyTextView.text.length != 0){
        Note *newNote = [[Note alloc]
                        initWithTitle: _titleTextView.text
                             setValue:_bodyTextView.text
                        ];

        [_currentTab addNote:newNote];
        
        ///====================================================================
            
            AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            NSManagedObjectContext* context = appDelegate.managedObjectContext;
        
        NSManagedObject *entityNameObj = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:context];
        
        NSManagedObject *parentTab = [NSEntityDescription insertNewObjectForEntityForName:@"Tab" inManagedObjectContext:context];
        
        [parentTab setValue:_currentTab.getName forKey:@"title"];
        
        [entityNameObj setValue:_titleTextView.text forKey:@"title"];
        [entityNameObj setValue:_bodyTextView.text forKey:@"content"];
        
        [entityNameObj setValue:parentTab forKey:@"parentTab"];
        
        [((AppDelegate*)[[UIApplication sharedApplication] delegate]) saveContext];
        
        ///====================================================================

        [[NSNotificationCenter defaultCenter] postNotificationName:@"addNote" object:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}

- (void)dismissKeyboard
{
    [_bodyTextView resignFirstResponder];
    [_titleTextView resignFirstResponder];
}

- (IBAction)dismissView:(id)sender {
    [_bodyTextView resignFirstResponder];
    [_titleTextView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
