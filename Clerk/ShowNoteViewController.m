//
//  ShowNoteViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "ShowNoteViewController.h"

@interface ShowNoteViewController ()

@end

@implementation ShowNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleTextView.text = _titleText;
    _bodyTextView.text = _bodyText;
    
    [_titleTextView setFont:[UIFont boldSystemFontOfSize:30]];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
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

- (IBAction)dismissView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) setIndex:(int)newIndex {
    index = newIndex;
}

- (IBAction)enableEditing:(id)sender {
    if(_enableEditingSwitch.on){
        _titleTextView.userInteractionEnabled = YES;
        _bodyTextView.userInteractionEnabled = YES;
    }
}

-(void) textViewDidChange:(UITextView *)textView {
    
    NSLog(@"yes");
    [[_currentTab getNotes][index] setTitle:_titleTextView.text];
//    [[_currentTab getNotes][index] setValue:_bodyTextView.text];

}

- (void)dismissKeyboard
{
    [_bodyTextView resignFirstResponder];
    [_titleTextView resignFirstResponder];
}

@end
