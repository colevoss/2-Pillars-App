//
//  FirstViewController.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;
@class LearnCustomCell;

@interface LearnViewController :  UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tableList;
    LearnCustomCell *cell;
}

@property (nonatomic, strong) WebViewController *webViewController;

@end
