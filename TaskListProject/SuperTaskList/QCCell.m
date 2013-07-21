//
//  QCCell.m
//  CheckboxButtonPractice
//
//  Created by QL Mac Lab on 7/21/13.
//  Copyright (c) 2013 Jasmine Baker. All rights reserved.
//

#import "QCCell.h"

@implementation QCCell

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:@"checkboxCell"];
//    if (self) {
//        // Initialization code
//    }
//    self.checked = NO;
//    return self;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkButton:(id)sender {

    if (! self.checked) {
        [_checkBoxButton setImage:[UIImage imageNamed:@"checkboxchecked.jpeg"] forState:UIControlStateNormal];
        self.checked=YES;
    }

    else if (self.checked) {
       [ _checkBoxButton setImage:[UIImage imageNamed:@"checkboxblank.jpeg"] forState:UIControlStateNormal];
        self.checked=NO;
    }
}


@end
