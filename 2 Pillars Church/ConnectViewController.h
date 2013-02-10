//
//  ConnectViewController.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 vkdevs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIAlertViewDelegate>
{
    NSArray *tableList;
    UIAlertView *info;
    
    // Prefs.
    NSUserDefaults *prefs;
}

@property (strong, nonatomic) UIWindow *window;

@end
