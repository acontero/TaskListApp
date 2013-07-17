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

//-(void) addTaskPressed: (id)sender
//{
//
//
//    QCAddTaskViewController *addTaskViewController = [[QCAddTaskViewController alloc] init];
//
//    [self.navigationController pushViewController: addTaskViewController animated:YES];
//
//}




////DV added this line of code


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasksArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    static NSString *cellId = @"enteredTaskCell";
    
    
    //DV added this code
    //    UITableViewCell *cell = [taskTableView dequeueReusableCellWithIdentifier:cellId];
    //    if (cell == nil){
    //        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    //
    //
    //            //the following code is largely standard for UITableView setup. Copy and paste this code
    //            static NSString *Cellidentifier = @"Cell";
    //
    //            UITableViewCell *cell = (UITableViewCell *) [taskTableView dequeueReusableCellWithIdentifier:Cellidentifier];
    //
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    }
    
    cell.textLabel.text = [[self.tasksArray objectAtIndex:indexPath.row] taskTitle];
    return cell;
    
    
    //DV NOT sure about the following code
    
    
    //NSLog(@"our current task array which is an organized set of Task Objects: %@",_tasks);
    //NSLog(@"the row selected by the user sent to our method as a parameter [indexPath row] (indexPath has a property row) %i",[indexPath row]);
    
    //returns our custom cell
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    //After the user touches the row, deselect the row
    
    EditTaskViewController *editTaskVC = [[EditTaskViewController alloc] initWithNibName:nil bundle:nil];
    NSLog(@"%@", editTaskVC);
    editTaskVC.editTasksScreen = [self.tasksArray objectAtIndex:indexPath.row];
    NSLog(@"%@", self.navigationController);
    
    [self.navigationController pushViewController:editTaskVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//implement this method to allow users to tap on rows
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    
//    //    Tasks *taskTitle = [self.tasksArray objectAtIndex:indexPath.row];
//    
//    //    Tasks *taskTitle = [Tasks createEntity];
//    //    taskTitle.duedate = list.duedate;
//    //    taskTitle.taskdescription = list.taskdescription;
//    //    taskTitle.reminder = [Tasks findAll].count + 1;
//    //
//    //    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
//}


//End of code DV added
//
//
//}








//    return cell;
//
//
//
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    

    
    // If row is deleted, remove it from the list.
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        
//        Lists *listToBeDeleted = self.tasksArray[indexPath.row];
//      
//        [listToBeDeleted MR_deleteEntity];
//        self.tasksArray = [Lists findAllSortedBy:@"nameTitle" ascending:YES];
//        [tableView reloadData];
//    }
//    
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//forRowAtIndexPath:(NSIndexPath *)indexPath {
//    // If row is deleted, remove it from the list.
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
//        
//        Lists *listToBeDeleted = self.listsArray[indexPath.row];
//        //        [listToBeDeleted MR_deleteInContext:[NSManagedObjectContext MR_contextForCurrentThread]];
//        //         [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveToPersistentStoreAndWait];
//        [listToBeDeleted MR_deleteEntity];
//        self.listsArray = [Lists findAllSortedBy:@"nameTitle" ascending:YES];
//        [tableView reloadData];
//    }
//



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
    // [self.tasksArray addObject:self.textLabel.text];
    self.tasksArray = [Tasks findAll];
    
    
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    [self.taskTableView reloadData];
}







@end
