//
//  QCDateViewController.m
//  datePicker
//
//  Created by Hasan Priyo on 7/13/13.
//  Copyright (c) 2013 Hasan Priyo. All rights reserved.
//

#import "QCDateViewController.h"

@interface QCDateViewController ()
@end
@implementation QCDateViewController
@synthesize myPicker;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    myPicker.datePickerMode = UIDatePickerModeDate;

    NSDate * choice = [myPicker date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM -yyyy"];
    NSString *dateString = [dateFormat stringFromDate:choice];
    
    self.label.text=dateString;

}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
}

- (void) showView

{
    NSLog(@"showView");
    self.myPicker.hidden=NO;
    self.isPickerShowing=YES;
    [self.view addSubview:myPicker];
    myPicker.frame = CGRectMake(0, -250, 320, 50);
    [UIView animateWithDuration:1.0
                     animations:^{
                         myPicker.frame = CGRectMake(0, 152, 320, 260);
                     }];
}

- (IBAction)chooseDate:(id)sender
{        
    NSDate * choice = [myPicker date];
    self.currentTaskToAssignDate.duedate = [choice timeIntervalSince1970];
    [[NSManagedObjectContext contextForCurrentThread] saveToPersistentStoreAndWait];
    NSLog(@"self.taskToBeEdited.duedate from DatePickerVC = %f",self.currentTaskToAssignDate.duedate);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
