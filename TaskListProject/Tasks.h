//
//  Tasks.h
//  SuperTaskList
//
//  Created by Donysa Vacharasanee on 7/18/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category, Lists;

@interface Tasks : NSManagedObject

@property (nonatomic, retain) NSString * categoryType;
@property (nonatomic) NSTimeInterval duedate;
@property (nonatomic) NSTimeInterval reminder;
@property (nonatomic, retain) NSString * taskdescription;
@property (nonatomic, retain) NSString * taskTitle;
@property (nonatomic, retain) Lists *list;
@property (nonatomic, retain) Category *correspondingCategory;

@end
