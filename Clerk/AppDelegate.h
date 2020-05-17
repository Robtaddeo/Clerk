//
//  AppDelegate.h
//  Clerk
//
//  Created by Robert Taddeo on 4/15/20.
//  Copyright © 2020 Robert Taddeo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

+ (AppDelegate *)sharedAppDelegate;

- (NSURL *)applicationDocumentsDirectory; // nice to have to reference files for core data

- (void)saveContext;

@end

