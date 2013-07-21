//
//  QCAddTaskViewController.m
//  SuperTaskList
//
//  Created by Jonathan Zhu on 6/16/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import "EditTaskViewController.h"

@interface EditTaskViewController ()

@end

@implementation EditTaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];    
    self.taskDescriptionTextView.text = @"Enter a description:";
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:(UIBarButtonItemStyleBordered) target:self action:@selector(saveButtonPressed:)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    
    NSLog(@"set savebutton in view did load editTasKVC");
    
   self.navigationItem.title = @"Edit Task";
    
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM -yyyy"];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:self.taskToBeEdited.duedate];
    
    NSString *dateString = [dateFormat stringFromDate: date];
    self.dueDateText.text = dateString;
//    self.categoryText.text = self.taskToBeEdited.categoryType;
//    NSLog(@"***categoryText is currently: %@",self.categoryText.text);
    self.taskDescriptionTextView.text = self.taskToBeEdited.taskdescription;
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return button pressed");
   
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions
//
//-(void)saveButtonPressed:(id)sender
//{
//    
//
//    self.taskToBeEdited.categoryType = self.categoryText.text;
//    self.taskToBeEdited.taskdescription = self.taskDescriptionTextView.text;
//    
//    
//    
//    [[NSManagedObjectContext contextForCurrentThread] saveToPersistentStoreAndWait];
//    [self.navigationController popViewControllerAnimated:YES];



@end
