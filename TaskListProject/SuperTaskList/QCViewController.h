//
//  QCViewController.h
//  datePicker
//
//  Created by Hasan Priyo on 7/13/13.
//  Copyright (c) 2013 Hasan Priyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditTaskViewController.h" //DV added this line of code

@interface QCViewController : UIViewController




- (IBAction)pickDate:(id)sender;

@property (strong, nonatomic) IBOutlet UIDatePicker *myPicker;

@property (nonatomic) BOOL isPickerShowing;

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) Tasks *taskBeingAssignedDueDate;

- (IBAction)chooseDate:(id)sender;

@end
