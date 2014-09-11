//
//  JDAppDelegate.h
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
