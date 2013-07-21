//
//  QCReviewViewController.m
//  settingPage
//
//  Created by Hasan Priyo on 7/16/13.
//  Copyright (c) 2013 Hasan Priyo. All rights reserved.
//

#import "QCReviewViewController.h"

@interface QCReviewViewController ()

@end

@implementation QCReviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        
        self.review.delegate = self;
        NSURL *url = [NSURL URLWithString:@"http://www.apple.com/itunes/"];
        NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
        [self.review loadRequest:requestURL];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
