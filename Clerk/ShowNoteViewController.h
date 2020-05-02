//
//  ShowNoteViewController.h
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowNoteViewController : UIViewController{
    int index;
}

@property (nonatomic, strong) Tab *currentTab;
@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *bodyText;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@property (weak, nonatomic) IBOutlet UISwitch *enableEditingSwitch;
-(void) setIndex:(int) newIndex;

@property (weak, nonatomic) IBOutlet UIButton *saveChangesButton;

@end

NS_ASSUME_NONNULL_END
