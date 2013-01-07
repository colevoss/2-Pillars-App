//
//  FirstViewController.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LearnCustomCell;
@class SermonParser;
@class SideTabViewController;
@class SermonViewController;
@class SermonDetailViewController;

@interface LearnViewController :  UIViewController 
{
    //Side-tab ivars
    BOOL menuOpen;
    IBOutlet UIView *mainView;
    IBOutlet SideTabViewController *sideTab;
    
    
    //Views to present
    SermonViewController *sermonViewController;
    SermonDetailViewController *sermonDetailViewController;
    
    UISwipeGestureRecognizer *leftSwipe;
    UISwipeGestureRecognizer *rightSwipe;
}

- (IBAction)handleLeftSwipe:(UISwipeGestureRecognizer *)sender;
- (IBAction)handleRightSwipe:(UISwipeGestureRecognizer *)sender;
@property(nonatomic, retain) UIView *mainView;
@property(nonatomic) BOOL menuOpen;
@property(nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property(nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;

- (void)menuTapped;
- (void)navMenuItemTapped:(int)row;



@end
