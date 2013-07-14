//
//  QCToDoListViewController.h
//  SuperTaskList
//
//  Created by QL Mac Lab on 6/29/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lists.h"
#import "Tasks.h"
#import "QCAppDelegate.h"

@interface QCToDoListViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *addTaskButton;


- (IBAction)addTaskButtonPressed:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *addListButton;

- (IBAction)addListButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *addNewTask;


@property (strong, nonatomic) IBOutlet UITextField *toDueList;
@property (strong, nonatomic) IBOutlet UITableView *listsTableView;
//@property (strong, nonatomic) NSMutableArray *listsArray;
@property (strong, nonatomic) NSArray *listsArray;



@end
