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
#import "InfoViewController.h"

@implementation IIAppDelegate

@synthesize window = _window;

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    tabBar = [[UITabBarController alloc] init];
//    
//    //Create Nav bar and set it's color to Black
//    NavController = [[UINavigationController alloc] initWithRootViewController:tabBar];
//    NavController.navigationBar.tintColor = [UIColor blackColor];
//    
//    
//    // Create the different view controllers
//    UIViewController *viewController1 = [[LearnViewController alloc] initWithNibName:@"LearnViewController"
//                                                                              bundle:nil];
//    
//    viewController1.navigationItem.title = @"Sermons";
//    UIViewController *viewController2 = [[InfoViewController alloc] initWithNibName:@"InfoViewController"
//                                                                             bundle:nil];
//    UIViewController *viewController3 = [[MoreViewController alloc] initWithNibName:@"MoreViewController" 
//                                                                             bundle:nil];
//
//
//    
//    //Set tab bar controllers
//    NSArray *controllers = [NSArray arrayWithObjects:viewController1, viewController2, viewController3, nil];
//    tabBar.viewControllers = controllers;
//    self.window.rootViewController = NavController;
//    [self.window makeKeyAndVisible];
//    
//    return YES;
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    
    
    //Learn View Controller creation
    //
    
    UIViewController *viewController1 = [[LearnViewController alloc] initWithNibName:@"LearnViewController" bundle:nil];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    navController1.navigationBar.barStyle = UIBarStyleBlack;
    
    
    //Info View Controller creation
    //
    
    UIViewController *viewController2 = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    navController1.navigationBar.barStyle = UIBarStyleBlack;
    
    
    
    //More View Controller creation
    //
    
    UIViewController *viewController3 = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    //set style of navController1 to black solid
    navController1.navigationBar.barStyle = UIBarStyleBlack;
    
    
    
    
    tabBar.viewControllers = @[navController1, navController2, navController3];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    
    
    
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
