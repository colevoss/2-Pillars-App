//
//  SecondViewController.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    NSArray *tableList;
    IBOutlet UITableView *table;
}
@property (strong, nonatomic) UIWindow *window;

@end
