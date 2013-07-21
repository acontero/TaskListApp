//
//  QCCell.m
//  CheckboxButtonPractice
//
//  Created by QL Mac Lab on 7/21/13.
//  Copyright (c) 2013 Jasmine Baker. All rights reserved.
//

#import "QCCell.h"

@implementation QCCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
