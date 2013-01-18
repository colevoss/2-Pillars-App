//
//  AppDelegate.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IIAppDelegate.h"

#import "LearnViewController.h"
#import "MoreViewController.h"
#import "ConnectViewController.h"

@implementation IIAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController.tabBar setTintColor:[UIColor colorWithRed:0.55686274509804 green:0.28627450980392 blue:0.01960784313725 alpha:0.88]];
    [tabBarController.tabBar setSelectedImageTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.55686274509804 green:0.28627450980392 blue:0.01960784313725 alpha:1.0]];
    
    //Learn View Controller
    //
    LearnViewController *viewController1 = [[LearnViewController alloc] initWithNibName:@"LearnViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    navController1.navigationBar.barStyle = UIBarStyleBlack;
    
    
    
    
    
    //Info View Controller
    //
    UIViewController *viewController2 = [[ConnectViewController alloc] initWithNibName:@"ConnectViewController" bundle:nil];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    navController2.navigationBar.barStyle = UIBarStyleBlack;
    
    
    
    //More View Controller
    //
    UIViewController *viewController3 = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    //set style of navController1 to black solid
    navController3.navigationBar.barStyle = UIBarStyleBlack;
    

    
    
    
    tabBarController.viewControllers = @[navController1, navController2, navController3];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    //This starts the app with the menu open.
    [viewController1 menuTapped];
    
    
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

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
