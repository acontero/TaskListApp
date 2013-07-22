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
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:(UIBarButtonItemStyleBordered) target:self action:@selector(saveButtonPressed:)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    
    NSLog(@"set savebutton in view did load editTasKVC");
    
    self.navigationItem.title = @"Edit Task";
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM -yyyy"];
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:self.taskToBeEdited.duedate];
    NSLog(@"self.taskToBeEdited.duedate from EditVC = %f",self.taskToBeEdited.duedate);
    if(self.taskToBeEdited.duedate){
        NSString *dateString = [dateFormat stringFromDate: date];
        self.dueDateText.text = dateString;
    }
    self.taskDescriptionTextView.text = self.taskToBeEdited.taskdescription;
}

//Not working...
//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    NSLog(@"return button pressed");
////    [self.taskTextField resignFirstResponder];
////    [self.dateDueTextField resignFirstResponder];
//    
//    return YES;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

-(void)saveButtonPressed:(id)sender
{
    self.taskToBeEdited.taskdescription = self.taskDescriptionTextView.text;
    [[NSManagedObjectContext contextForCurrentThread] saveToPersistentStoreAndWait];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
