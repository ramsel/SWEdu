//
//  SWAppDelegate.m
//  Edu
//
//  Created by Admin on 1/24/14.
//  Copyright (c) 2014 Lextopher Jones. All rights reserved.
//

#import "SWAppDelegate.h"
#import "TestFlight.h"




@implementation SWAppDelegate

@synthesize user,
firstViewController,
secondViewController,
navController,
logInViewController,
tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // ****************************************************************************
    // Parse initialization
    [Parse setApplicationId:@"nLSIr01l3GVYPgTEL76Wz5XGjHiwMUSJKbCdAvv1"
                  clientKey:@"fuOwllSn0qRA3rz63e3mJiwtkgLt7Woz9bF0WrKH"];
    // ****************************************************************************

    
    // Automatic User
    [PFUser enableAutomaticUser];
    
    
    // ****************************************************************************
    // Testflight initialization
    //    [TestFlight setDeviceIdentifier:[[UIDevice currentDevice] uniqueIdentifier]]; // TODO: COMMENT OUT FOR PRODUCTION
    [TestFlight takeOff:@"4885a903-1c9d-4dd3-953a-c30944e78f40"];
    // ****************************************************************************
    
   
    [self createTabBarController];
    
    self.logInViewController = [[SWLogInViewController alloc] init];

    self.navController = [[UINavigationController alloc] initWithRootViewController:self.logInViewController];

    
    self.navController.navigationBarHidden = NO;
    
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    
    
    [self setupAppearance];



    // Enable Push
    // Register for push notifications
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeAlert |
     UIRemoteNotificationTypeSound];
    
    
   

    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:newDeviceToken];
    [currentInstallation saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            // Subscribe to push
            PFInstallation *currentInstallation = [PFInstallation currentInstallation];
            [currentInstallation addUniqueObject:@"All" forKey:@"channels"];
            [currentInstallation saveInBackground];

        }
    }];
}


- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}






#pragma mark - ()
- (void)createTabBarController {
    
    
    self.tabBarController = [[SWTabBarViewController alloc] init];
    
    
    self.firstViewController = [[SWChatViewController alloc] init];
    self.secondViewController = [[SWProfileViewController alloc] init];
    
    
    
    
    UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:self.firstViewController];
    UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:self.secondViewController];
    
    
    [firstNavigationController.navigationBar setTranslucent:NO];
    [secondNavigationController.navigationBar setTranslucent:NO];
    
    
    
    
    UITabBarItem *firstTabBarItem = [[UITabBarItem alloc] init];
//    firstTabBarItem.imageInsets = UIEdgeInsetsTabBarItemDetails;
    [firstTabBarItem setTag:0];
    [firstTabBarItem setTitle:@"FIRST"];
    
    UITabBarItem *secondTabBarItem = [[UITabBarItem alloc] init];
    //    firstTabBarItem.imageInsets = UIEdgeInsetsTabBarItemDetails;
    [secondTabBarItem setTag:0];
    [secondTabBarItem setTitle:@"SECOND"];


    
 
    
    
    
    [firstNavigationController setTabBarItem:firstTabBarItem];
    [secondNavigationController setTabBarItem:secondTabBarItem];
    
    
    
    
    
//    self.tabBarController.delegate = self;
//    self.tabBarController.viewControllers = @[ firstNavigationController, secondNavigationController];
//    
//    [self.navController setViewControllers:@[ self.tabBarController ] animated:NO];
//    
//    [self.navController.navigationBar setTranslucent:NO];
    
    
    [self.navController setViewControllers:@[ firstNavigationController ] animated:NO];

    [self.navController.navigationBar setTranslucent:NO];
    
    
   
    
}


- (void)setupAppearance {
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           UITextAttributeTextColor: [UIColor blackColor],
                                                           UITextAttributeFont: [UIFont fontWithName:kMasterBoldFontName size:16.0],
                                                           }];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    if (iOS_7_OR_LATER) {
        [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    }
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           UITextAttributeTextColor: [UIColor whiteColor],
                                                           }];
    
    
    
    //    [[UIButton appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleColor:[UIColor colorWithRed:214.0f/255.0f green:210.0f/255.0f blue:197.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
    //
    //    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"ButtonBack.png"]
    //                                                      forState:UIControlStateNormal
    //                                                    barMetrics:UIBarMetricsDefault];
    //
    //    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"ButtonBackSelected.png"]
    //                                                      forState:UIControlStateSelected
    //                                                    barMetrics:UIBarMetricsDefault];
    
    
    
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           UITextAttributeTextColor: [UIColor colorWithRed:214.0f/255.0f green:210.0f/255.0f blue:197.0f/255.0f alpha:1.0f],
                                                           } forState:UIControlStateNormal];
    
    [[UISearchBar appearance] setTintColor:[UIColor lightGrayColor]];
}


- (void)handlePush:(NSDictionary *)launchOptions {
    
    // If the app was launched in response to a push notification, we'll handle the payload here
    NSDictionary *remoteNotificationPayload = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    
    if (remoteNotificationPayload) {
        [[NSNotificationCenter defaultCenter] postNotificationName:PAPAppDelegateApplicationDidReceiveRemoteNotification object:nil userInfo:remoteNotificationPayload];
        
//        if (![PFUser currentUser]) {
//            return;
//        }
        
        
        // If the push notification payload references a an achievement, show an achievement share
        NSString *payloadSender = [remoteNotificationPayload objectForKey:@"f"];
        NSString *message = [remoteNotificationPayload objectForKey:@"m"];
        if (![payloadSender isEqualToString:self.user]) {
            
            SWChatViewController* chatController = [self.navController.viewControllers objectAtIndex:1];
            
            if ([chatController isKindOfClass:[SWChatViewController class]]) {
                [chatController receivedMessagePushFromUser:payloadSender message:message];
            }
            
            
            return;
        }
        
        
         }
}



@end
