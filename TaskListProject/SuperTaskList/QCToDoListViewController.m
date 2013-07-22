//
//  QCToDoListViewController.m
//  SuperTaskList
//
//  Created by QL Mac Lab on 6/29/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import "QCToDoListViewController.h"


@interface QCToDoListViewController ()

@end

@implementation QCToDoListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
   
    self.toDueList.delegate=self;
    self.listsTableView.delegate=self;
    self.listsTableView.dataSource=self;
    self.listsArray = [[NSArray alloc] init];
    
}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    self.listsArray = [Lists findAllSortedBy:@"nameTitle" ascending:YES];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isNotFirstTimeUser = [userDefaults boolForKey:firstTimeUser];
    
    if (!isNotFirstTimeUser) {
        [self createDefaultList];
    }

    [self.listsTableView reloadData];
}
-(void)createDefaultList{
    
    Lists *mylist = [Lists createEntity];
    mylist.nameTitle= @"Everyday To-Do List (Default)";
    
    [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveToPersistentStoreAndWait];

    self.listsArray = [Lists findAllSortedBy:@"nameTitle" ascending:YES];

    [self.listsTableView reloadData];
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];

    [standardUserDefaults setBool:YES forKey:firstTimeUser];
    [standardUserDefaults synchronize];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listsArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    }
    
    Lists  * list = self.listsArray[indexPath.row];
    NSLog(@"**** %i %@", indexPath.row, list);
    NSLog(@"%@", list.nameTitle);
    cell.textLabel.text = [list nameTitle];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    
    
    TasksViewController *TasksVC = [self.storyboard instantiateViewControllerWithIdentifier:@"taskViewControllerUI"];
    TasksVC.currentList=[self.listsArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:TasksVC animated:YES ];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}

-(void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        Lists *listToBeDeleted = self.listsArray[indexPath.row];
        [listToBeDeleted MR_deleteEntity];
        self.listsArray = [Lists findAllSortedBy:@"nameTitle" ascending:YES];
        [tableView reloadData];
    }
    
}

-(void) setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.listsTableView setEditing:editing animated:animated];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return button pressed");
    [self.toDueList resignFirstResponder];
   
    return YES;
    
}


- (IBAction)addListButtonPressed:(id)sender
{
    NSLog(@"addListButtonPressed");
    Lists *mylist = [Lists createEntity];
    mylist.nameTitle= self.toDueList.text;
    [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveToPersistentStoreAndWait];

    self.listsArray = [Lists findAllSortedBy:@"nameTitle" ascending:YES];;
    
    [self.listsTableView reloadData];
    NSLog(@"reloaded and added list %@",mylist.nameTitle);
    
    self.toDueList.text = @"";
}

@end
