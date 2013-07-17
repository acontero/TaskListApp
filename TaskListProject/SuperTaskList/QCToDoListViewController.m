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

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
   
    self.toDueList.delegate=self;
    self.listsTableView.delegate=self;
    self.listsTableView.dataSource=self;
    self.listsArray = [[NSArray alloc] init];
    
    
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:firstTimeUser]){
//        [self createDefaultList];
//    }
    
    
    
}


-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    
//    self.listsArray = [[NSMutableArray alloc] initWithArray:[Lists findAll]];
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
    mylist.nameTitle= @"Everyday ToDue List (Default)";
    
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
    
    
    
    
    
//    if (indexPath.row > 0 ){
//        NSLog(@"wierd logic");}
//        
//        
//    else{
//        Lists *list = [self.listsArray objectAtIndex:indexPath.row];
//        NSLog(@"%@", list);
//        
//        
//        
//        
//    }
    
    
    // UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc]
    //                                         initWithTarget:self action:@selector(handleSwipeFrom:)];
    //    [gesture setDirection:
    //     (UISwipeGestureRecognizerDirectionLeft
    //      |UISwipeGestureRecognizerDirectionRight)];
    //[tableView addGestureRecognizer:gesture];
    //[gesture release];
    
    return cell;
    
}

//- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
//    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
//        [self moveLeftColumnButtonPressed:nil];
//    }
//    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
//        [self moveRightColumnButtonPressed:nil];
//    }
//
//    - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//        // Return YES if you want the specified item to be editable.
//        return YES;
//    }
//
//    // Override to support editing the table view.
//    - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//        if (editingStyle == UITableViewCellEditingStyleDelete) {
//            //add code here for when you hit delete
//        }
//    }


-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    
    
    TasksViewController *TasksVC = [self.storyboard instantiateViewControllerWithIdentifier:@"taskViewControllerUI"];
    TasksVC.currentList=[self.listsArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:TasksVC animated:YES ];
    
    
    // [self.navigationController pushViewController:secondVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}

-(void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {


    
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
        // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
      
        Lists *listToBeDeleted = self.listsArray[indexPath.row];        
//        [listToBeDeleted MR_deleteInContext:[NSManagedObjectContext MR_contextForCurrentThread]];
//         [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveToPersistentStoreAndWait];
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


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    clearField = YES;
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
    
}







@end
