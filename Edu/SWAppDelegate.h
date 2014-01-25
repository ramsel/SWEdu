//
//  SWAppDelegate.h
//  Edu
//
//  Created by Admin on 1/24/14.
//  Copyright (c) 2014 Lextopher Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTabBarViewController.h"
#import "SWChatViewController.h"
#import "SWProfileViewController.h"
#import "PAPWelcomeViewController.h"
#import "SWLogInViewController.h"


@interface SWAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString* user; // TEMP


@property (nonatomic, strong) SWTabBarViewController *tabBarController;
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) SWLogInViewController *logInViewController;

@property (nonatomic, strong) SWChatViewController *firstViewController;
@property (nonatomic, strong) SWProfileViewController *secondViewController;

@end
