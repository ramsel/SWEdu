//
//  SWSecondViewController.m
//  Edu
//
//  Created by Admin on 1/24/14.
//  Copyright (c) 2014 Lextopher Jones. All rights reserved.
//

#import "SWSecondViewController.h"

@interface SWSecondViewController ()

@end

@implementation SWSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor =  [UIColor whiteColor];
    
    ////////////////
    // NavBar
    
    // Title View
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setFont:[UIFont fontWithName:kMasterBoldFontName size:kNavBarTitleFontSize]];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setText:@"SWEDU"];
    [titleLabel sizeToFit];
    UIView *TitleView = [[UIView alloc] initWithFrame:titleLabel.frame];
    [TitleView addSubview:titleLabel];
    self.navigationItem.titleView = TitleView;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
