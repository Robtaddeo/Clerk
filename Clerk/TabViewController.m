//
//  TabViewController.m
//  Clerk
//
//  Created by Robert Taddeo on 4/24/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import "TabViewController.h"
#import "MainViewController.h"
#import "FastSegue.h"
#import "User.h"
#import <UIKit/UIKit.h>

@interface TabViewController () {
    User * currentUser;
}

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topBarLogo"]];
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];

    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];

    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    currentUser = [[User alloc] initWithUid:0 andName:@"Robert Taddeo" andEmail:@"robtaddeo@gmail.com" andImgUrl:@"test.jpg" andNotifications:YES];
    [self performSegueWithIdentifier:@"FastSegue" sender:nil];
    
    Tab *schoolTab = [[Tab alloc] initWithName:@"School"];
    Tab *workTab = [[Tab alloc] initWithName:@"Work"];
    Tab *personalTab = [[Tab alloc] initWithName:@"Personal"];
    Tab *exerciseTab = [[Tab alloc] initWithName:@"Exercise"];
    
    [currentUser addTab:schoolTab];
    [currentUser addTab:workTab];
    [currentUser addTab:personalTab];
    [currentUser addTab:exerciseTab];
    
    for(int i = 0; i < [currentUser getTabCount]; i++) {
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        [[currentUser getTabs][i] setColor:color];
    }
    
    
    for(int i = 0; i < 1000; i++){
        Task *newTask = [[Task alloc] initWithValue: [NSString stringWithFormat:@"Task %d", i]
                                         setDueDate: [NSDate date]
                                             setTab: [currentUser getTabs][arc4random() % 4]];
        [currentUser addTask:newTask];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [currentUser getTabCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[currentUser getTabs][indexPath.row] getName];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        [self performSegueWithIdentifier:@"swipeSegue" sender:nil];
    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
    }

}

// This will get called too before the view appears
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"FastSegue"] || [[segue identifier] isEqualToString:@"swipeSegue"] || [[segue identifier] isEqualToString:@"buttonSegue"]) {

        // Get destination view
        MainViewController *vc = [segue destinationViewController];
        [vc setUser: self->currentUser];
    }
}

@end
