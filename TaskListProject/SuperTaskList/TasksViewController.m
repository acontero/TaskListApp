//
//  SubtasksListViewController.m
//  SuperTaskList
//
//  Created by Jonathan Zhu on 6/16/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import "TasksViewController.h"

@interface TasksViewController ()

@end

@implementation TasksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.taskTableView.dataSource=self;
    self.taskTableView.delegate = self;
    self.textLabel.delegate=self;
    NSLog(@"viewDidLoad");
}

- (void) viewDidAppear:(BOOL) animated
{
    [super viewDidAppear:YES];
    self.tasksArray = [Tasks findByAttribute:@"list" withValue:self.currentList];
    //
    //After we setup our "Data source" we call the method reload on our tableView object so that the tableview will properly display the appropraite information.
    [self.taskTableView reloadData];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasksArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    }
    
    cell.textLabel.text = [[self.tasksArray objectAtIndex:indexPath.row] taskTitle];
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    //After the user touches the row, deselect the row

    EditTaskViewController *editTaskVC = [self.storyboard instantiateViewControllerWithIdentifier:@"editTaskViewControllerUI"];
    //NSLog(@"%@", editTaskVC);
    editTaskVC.taskToBeEdited = [self.tasksArray objectAtIndex:indexPath.row];
    //NSLog(@"%@", self.navigationController);
    NSLog(@"about to push editVC");
    [self.navigationController pushViewController:editTaskVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"button pressed");
    [self.textLabel resignFirstResponder];
    return YES;
}


-(void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        Tasks *taskToBeDeleted = self.tasksArray[indexPath.row];
        //        [listToBeDeleted MR_deleteInContext:[NSManagedObjectContext MR_contextForCurrentThread]];
        //         [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveToPersistentStoreAndWait];
        [taskToBeDeleted MR_deleteEntity];
        self.tasksArray = [Tasks findAllSortedBy:@"taskTitle" ascending:YES];
        [tableView reloadData];
    }
    
}

-(void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.taskTableView setEditing:editing animated:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskButtonPressed:(id)sender
{
    Tasks *task = [Tasks createEntity];
    task.taskTitle = self.textLabel.text;
    // [self.tasksArray addObject:self.textLabel.text];
    task.list = self.currentList;
    self.tasksArray = [Tasks findByAttribute:@"list" withValue:self.currentList];
    self.textLabel.text = @"";
    
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    [self.taskTableView reloadData];
}







@end
