//
//  MoreViewController.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WebViewController;
@interface MoreViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tableList;
    UITableView *table;
}
//@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) WebViewController *webViewController;

@end
