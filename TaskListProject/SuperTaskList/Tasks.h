//
//  Tasks.h
//  SuperTaskList
//
//  Created by Donysa Vacharasanee on 7/13/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Lists;

@interface Tasks : NSManagedObject

@property (nonatomic) NSTimeInterval duedate;
@property (nonatomic, retain) NSString * taskdescription;
@property (nonatomic) NSTimeInterval reminder;
@property (nonatomic, retain) NSString * taskTitle;
@property (nonatomic, retain) Lists *list;

@end
