//
//  Tasks.h
//  SuperTaskList
//
//  Created by Angelica Contero on 7/21/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Lists;

@interface Tasks : NSManagedObject

@property (nonatomic) NSTimeInterval duedate;
@property (nonatomic) NSTimeInterval reminder;
@property (nonatomic, retain) NSString * taskdescription;
@property (nonatomic, retain) NSString * taskTitle;
@property (nonatomic) BOOL completed;
@property (nonatomic, retain) Lists *list;

@end
