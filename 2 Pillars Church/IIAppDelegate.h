//
//  AppDelegate.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IIAppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *NavController;

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBar;

@property (strong, nonatomic) UINavigationController *NavController;


@end