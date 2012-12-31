//
//  SideTabViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 12/5/12.
//
//

#import <UIKit/UIKit.h>

@class LearnViewController;
@class BlogView;
@class SermonViewController;

@interface SideTabViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tableList;
    LearnViewController *mainWindow;
    UIAlertView *info;
}

@property (assign, readwrite) LearnViewController *mainWindow;

@end
