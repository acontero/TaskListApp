//
//  QCCell.m
//  CheckboxButtonPractice
//
//  Created by QL Mac Lab on 7/21/13.
//  Copyright (c) 2013 Jasmine Baker. All rights reserved.
//

#import "QCCell.h"

@implementation QCCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkButton:(id)sender {

    if (!self.currentTask.completed) {
        [_checkBoxButton setImage:[UIImage imageNamed:@"checkboxchecked.jpeg"] forState:UIControlStateNormal];
        self.currentTask.completed = YES;
        NSLog(@"task completed: %i",self.currentTask.completed);
        
    }

    else if (self.currentTask.completed) {
       [ _checkBoxButton setImage:[UIImage imageNamed:@"checkboxblank.jpeg"] forState:UIControlStateNormal];
        self.currentTask.completed = NO;
        NSLog(@"task completed: %i",self.currentTask.completed);
    }
}


@end
