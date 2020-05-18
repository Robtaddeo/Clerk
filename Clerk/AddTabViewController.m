//
//  AddTabViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "AddTabViewController.h"
#import "Tab.h"
#import "AppDelegate.h"



@interface AddTabViewController ()

@end

@implementation AddTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addTabButton.layer.cornerRadius = 5;
    
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

// Color Buttons

- (IBAction)setGreen:(id)sender {
//    UIButton *btn = (UIButton *) sender;
    _addTabButton.backgroundColor = [UIColor systemGreenColor];
}

- (IBAction)setIndigo:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemIndigoColor];
}

- (IBAction)setOrange:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemOrangeColor];
}

- (IBAction)setViolet:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemPinkColor];
}

- (IBAction)setPurple:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemPurpleColor];
}

- (IBAction)setRed:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemRedColor];
}

- (IBAction)setLightBlue:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemBlueColor];
}

- (IBAction)setYellow:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemYellowColor];
}

- (IBAction)setGrey:(id)sender {
    _addTabButton.backgroundColor = [UIColor systemGrayColor];
}

- (IBAction)setBlack:(id)sender {
    _addTabButton.backgroundColor = [UIColor blackColor];
}

// Dismiss Keyboard

- (void)dismissKeyboard
{
    [_tabNameTextField resignFirstResponder];
}


- (IBAction)addTabEvent:(id)sender {
    if(_tabNameTextField.text.length > 0){
        Tab *newTab = [[Tab alloc] initWithName: _tabNameTextField.text];
        [newTab setColor: (UIColor *) _addTabButton.backgroundColor];
        [_currentUser addTab:newTab];
        
//        NSManagedObjectContext *context = ((AppDelegate*)[[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
        
    ///====================================================================
        
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        NSManagedObjectContext* context = appDelegate.managedObjectContext;
        
        
        NSManagedObject *entityNameObj = [NSEntityDescription insertNewObjectForEntityForName:@"TabObj" inManagedObjectContext:context];
        [entityNameObj setValue:_tabNameTextField.text forKey:@"title"];
        
        [((AppDelegate*)[[UIApplication sharedApplication] delegate]) saveContext];
//        [context saveContext];
        
        NSFetchRequest *testRequest = [NSFetchRequest fetchRequestWithEntityName:@"TabObj"];
        NSArray *results = [context executeRequest:testRequest error:nil];
        NSLog(@"Tab was named: ", [results valueForKey:@"title"]);
        
    ///====================================================================
        
        NSDictionary *dict = [NSDictionary dictionaryWithObject:_currentUser forKey:@"user"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"addTab" object:nil userInfo:dict];
        [_tabNameTextField resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (IBAction)cancelTab:(id)sender {
    [_tabNameTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
