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
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"send.png"]];
    
    //BACK BUTTON
    UIImage *backImage = [UIImage imageNamed:@"backbutton.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage: [backImage stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateNormal];
//    [button setBackgroundImage: [[UIImage imageNamed: @"right_clicked.png"] stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateHighlighted];
    
    backButton.frame= CGRectMake(0.0, 0.0, backImage.size.width, backImage.size.height);
    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, backImage.size.width, backImage.size.height) ];
    [backButton addTarget:self action:@selector(goToPreviousView) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:backButton];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:v];
    self.navigationItem.leftBarButtonItem= back;
    
    //SAVE BUTTON
    UIImage *saveImage = [UIImage imageNamed:@"save.png"];
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton setBackgroundImage: [saveImage stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateNormal];
    //    [button setBackgroundImage: [[UIImage imageNamed: @"right_clicked.png"] stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateHighlighted];
    
    saveButton.frame= CGRectMake(0.0, 0.0, saveImage.size.width, saveImage.size.height);
    UIView *saveView=[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, saveImage.size.width, saveImage.size.height) ];
    [saveButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [saveView addSubview:saveButton];
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithCustomView:saveView];
    self.navigationItem.rightBarButtonItem= save;
    
        
    NSLog(@"set savebutton in view did load editTasKVC");
    
//    self.navigationItem.title = @"Edit Task";
}

-(void)goToPreviousView{
    [self.navigationController popViewControllerAnimated:YES];
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
