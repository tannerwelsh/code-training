//
//  XYZAppDelegate.h
//  ToDoList
//
//  Created by Tanner Welsh on 10/27/13.
//  Copyright (c) 2013 Tanner Welsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSArray *)getAllToDoItems;

@end
