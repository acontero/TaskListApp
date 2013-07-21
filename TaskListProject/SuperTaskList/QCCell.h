//
//  QCCell.h
//  CheckboxButtonPractice
//
//  Created by QL Mac Lab on 7/21/13.
//  Copyright (c) 2013 Jasmine Baker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCCell : UITableViewCell
@property BOOL checked;
@property (strong, nonatomic) IBOutlet UIButton *checkBoxButton;
- (IBAction)checkButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *taskName;

@end
