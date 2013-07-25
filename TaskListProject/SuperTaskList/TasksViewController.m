//
//  TasksListViewController.m
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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
	// Do any additional setup after loading the view, typically from a nib.
    
    self.textLabel.delegate=self;
    NSLog(@"viewDidLoad");
   
}

- (void) viewDidAppear:(BOOL) animated
{
    [super viewDidAppear:YES];
    self.tasksArray = [Tasks findAll];
    self.tasksArray = [Tasks findByAttribute:@"list" withValue:self.currentList];

    //After we setup our "Data source" we call the method reload on our tableView object so that the tableview will properly display the appropriate information.
    [self.taskTableView reloadData];
    NSLog(@"viewDidAppear");
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasksArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cellidentifier = @"QCCell";
    QCCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QCCell" owner:self options: nil];
        cell = [nib objectAtIndex:0];
    }
    cell.currentTask = [self.tasksArray objectAtIndex:indexPath.row];
    cell.taskName.text = [[self.tasksArray objectAtIndex:indexPath.row] taskTitle];
    BOOL checked = [[self.tasksArray objectAtIndex:indexPath.row] completed];
    
    if (checked == YES) {
        [cell.checkBoxButton setImage:[UIImage imageNamed:@"checkboxmark.png"] forState:UIControlStateNormal];
    }
    else{
        [cell.checkBoxButton setImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
    }

    NSLog(@"task completed: %i",[[self.tasksArray objectAtIndex:indexPath.row] completed]);
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    //After the user touches the row, deselect the row
    
    EditTaskViewController *editTaskVC = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil] instantiateViewControllerWithIdentifier:@"editTaskPage"];
    editTaskVC.taskToBeEdited = [self.tasksArray objectAtIndex:indexPath.row];
    NSLog(@"%@", self.navigationController);
    
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskButtonPressed:(id)sender
{
    Tasks *task = [Tasks createEntity];
    task.taskTitle = self.textLabel.text;
    task.list = self.currentList;
    // [self.tasksArray addObject:self.textLabel.text];
    task.list = self.currentList;
    task.completed = NO;
    //self.tasksArray = [Tasks findAll];
    self.tasksArray = [Tasks findByAttribute:@"list" withValue:self.currentList];
    
    
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    [self.taskTableView reloadData];
    
    self.textLabel.text = @"";

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        Tasks *taskToBeDeleted = self.tasksArray[indexPath.row];
        [taskToBeDeleted MR_deleteEntity];
        self.tasksArray = [Tasks findByAttribute:@"list" withValue:self.currentList];;
        [tableView reloadData];
    }
    
}

-(void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.taskTableView setEditing:editing animated:animated];
    
}







@end
