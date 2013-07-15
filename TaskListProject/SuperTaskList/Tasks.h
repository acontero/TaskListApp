//
//  Tasks.h
//  SuperTaskList
//
//  Created by QL Mac Lab on 7/14/13.
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
@property (nonatomic, retain) Lists *list;

@end
