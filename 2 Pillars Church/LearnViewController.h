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
@class SermonViewController;
@class SermonaViewController;
@class BlogViewController;
@class MusicViewController;

@interface LearnViewController :  UIViewController 
{
    //Menu ivars
    BOOL menuOpen;
    IBOutlet UIView *mainView;
    
    //Views to present
    SermonViewController *sermonController;
    SermonaViewController *sermonaController;
    BlogViewController *blogController;
    MusicViewController *musicController;
    
    //Swipes
    UISwipeGestureRecognizer *upSwipe;
    UISwipeGestureRecognizer *downSwipe;
    
    //Prefs
    NSUserDefaults *prefs;
}

- (IBAction)handleUpSwipe:(UISwipeGestureRecognizer *)sender;
- (IBAction)handleDownSwipe:(UISwipeGestureRecognizer *)sender;
@property(nonatomic) IBOutlet UISwipeGestureRecognizer *upSwipe;
@property(nonatomic) IBOutlet UISwipeGestureRecognizer *downSwipe;

@property(nonatomic, retain) UIView *mainView;
@property(nonatomic) BOOL menuOpen;

- (void)menuTapped;

- (IBAction)buttonPressed:(id)sender;



@end
