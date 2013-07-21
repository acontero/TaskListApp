//
//  QCViewController.h
//  CheckboxButtonPractice
//
//  Created by QL Mac Lab on 6/26/13.
//  Copyright (c) 2013 Jasmine Baker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCViewController : UIViewController{
    BOOL checked;
}
@property (strong, nonatomic) IBOutlet UIButton *checkBoxButton;
- (IBAction)checkButton:(id)sender;

@end
