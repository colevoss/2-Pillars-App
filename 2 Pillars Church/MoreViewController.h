//
//  MoreViewController.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/10/12.
//  Copyright (c) 2012 vkdevs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WebViewController;
@interface MoreViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    NSArray *tableList;
}
@property (nonatomic, strong) WebViewController *webViewController;

@end
