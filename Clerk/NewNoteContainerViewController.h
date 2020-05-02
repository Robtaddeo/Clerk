//
//  newNoteContainerViewController.h
//  Clerk
//
//  Created by Robert Taddeo on 5/2/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab.h"

NS_ASSUME_NONNULL_BEGIN

@interface newNoteContainerViewController : UIViewController
@property (nonatomic, strong) Tab *currentTab;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

NS_ASSUME_NONNULL_END
