//
//  XYZToDoItem.h
//  ToDoList
//
//  Created by Tanner Welsh on 10/27/13.
//  Copyright (c) 2013 Tanner Welsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *completedDate;

@end
