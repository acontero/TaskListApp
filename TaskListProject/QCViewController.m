//
//  QCViewController.m
//  CheckboxButtonPractice
//
//  Created by QL Mac Lab on 6/26/13.
//  Copyright (c) 2013 Jasmine Baker. All rights reserved.
//

#import "QCViewController.h"

@interface QCViewController ()

@end

@implementation QCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    checked=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkButton:(id)sender {
    
    if (! checked) {
        [_checkBoxButton setImage:[UIImage imageNamed:@"checkboxchecked.jpeg"] forState:UIControlStateNormal];
        checked=YES;
    }
    
    else if (checked) {
       [ _checkBoxButton setImage:[UIImage imageNamed:@"checkboxblank.jpeg"] forState:UIControlStateNormal];
        checked=NO;
    }
}
@end
