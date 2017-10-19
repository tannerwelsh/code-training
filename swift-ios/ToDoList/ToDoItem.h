//
//  ToDoItem.h
//  ToDoList
//
//  Created by Tanner Welsh on 10/27/13.
//  Copyright (c) 2013 Tanner Welsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSString *itemName;
@property (nonatomic, retain) NSNumber *completed;
@property (nonatomic, retain) NSDate *completedDate;

@end
