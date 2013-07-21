//
//  QCAddTaskViewController.h
//  SuperTaskList
//
//  Created by Jonathan Zhu on 6/16/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TasksViewController.h"
#import "Tasks.h"
#import "QCViewController.h" //this is HPs DatePickerVC
#import "Category.h"

@interface EditTaskViewController : UITableViewController
<UITextFieldDelegate, UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UITableViewCell *dueDateCell;

@property (strong, nonatomic) IBOutlet UITableViewCell *reminderCell;

@property (strong, nonatomic) IBOutlet UITableViewCell *taskCategoryCell;

@property (strong, nonatomic) IBOutlet UITextView *taskDescriptionTextView;

@property (strong, nonatomic) Tasks *taskToBeEdited;

@property (strong, nonatomic) IBOutlet UILabel *dueDateText;
@property (strong, nonatomic) IBOutlet UILabel *reminderText;
@property (strong, nonatomic) IBOutlet UILabel *categoryText;



@end
