//
//  SWAppDelegate.h
//  Edu
//
//  Created by Admin on 1/24/14.
//  Copyright (c) 2014 Lextopher Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTabBarViewController.h"
#import "SWFirstViewController.h"
#import "SWSecondViewController.h"

@interface SWAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic, strong) SWTabBarViewController *tabBarController;
@property (nonatomic, strong) UINavigationController *navController;

@property (nonatomic, strong) SWFirstViewController *firstViewController;
@property (nonatomic, strong) SWSecondViewController *secondViewController;

@end
