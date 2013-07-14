//
//  Tasks.h
//  SuperTaskList
//
//  Created by QL Mac Lab on 7/13/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Lists;

@interface Tasks : NSManagedObject

@property (nonatomic) NSTimeInterval duedate;
@property (nonatomic) NSTimeInterval reminder;
<<<<<<< HEAD
@property (nonatomic, retain) NSString * taskdescription;
=======
@property (nonatomic, retain) NSString * taskTitle;
>>>>>>> 98bb488b2794dc5249309e9e8c5656162f4c01ad
@property (nonatomic, retain) Lists *list;

@end
