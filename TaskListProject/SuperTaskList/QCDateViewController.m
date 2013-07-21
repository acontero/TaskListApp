//
//  QCViewController.m
//  datePicker
//
//  Created by Hasan Priyo on 7/13/13.
//  Copyright (c) 2013 Hasan Priyo. All rights reserved.
//

#import "QCDateViewController.h"

@interface QCViewController ()
@end
@implementation QCViewController
@synthesize myPicker;



- (void)viewDidLoad

{
    [super viewDidLoad];
    
    self.myPicker.hidden = YES;
    self.isPickerShowing = NO;
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
}

- (IBAction)pickDate:(id)sender

{
    if (self.isPickerShowing ==  NO){
        NSLog(@"pickDate");
        [self showView];
    }
    else {
        [self hideView];
    }

}

- (void) hideView

{
    [UIView animateWithDuration:0.5
                     animations:^{
                         myPicker.frame = CGRectMake(0, -250, 320, 50);
                     } completion:^(BOOL finished) {
                         [myPicker removeFromSuperview];
                     }];
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

//================================================================================================================================================

- (IBAction)chooseDate:(id)sender {
    
    NSDate * choice = [myPicker date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM -yyyy"];
    NSString *dateString = [dateFormat stringFromDate:choice];
    
    self.label.text=dateString;
}

//================================================================================================================================================

@end
