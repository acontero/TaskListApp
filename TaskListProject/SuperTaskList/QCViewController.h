//
//  QCViewController.h
//  datePicker
//
//  Created by Hasan Priyo on 7/13/13.
//  Copyright (c) 2013 Hasan Priyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QCViewController : UIViewController




- (IBAction)pickDate:(id)sender;

@property (strong, nonatomic) IBOutlet UIDatePicker *myPicker;

@property (nonatomic) BOOL isPickerShowing;

@property (strong, nonatomic) IBOutlet UILabel *label;


- (IBAction)chooseDate:(id)sender;

@end
