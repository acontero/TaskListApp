//
//  Lists.h
//  SuperTaskList
//
//  Created by QL Mac Lab on 7/13/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tasks;

@interface Lists : NSManagedObject

@property (nonatomic, retain) NSString * nameTitle;
@property (nonatomic, retain) NSSet *task;
@end

@interface Lists (CoreDataGeneratedAccessors)

- (void)addTaskObject:(Tasks *)value;
- (void)removeTaskObject:(Tasks *)value;
- (void)addTask:(NSSet *)values;
- (void)removeTask:(NSSet *)values;

@end
