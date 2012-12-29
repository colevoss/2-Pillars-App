//
//  FirstViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearnViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "SermonViewController.h"
#import "BlogView.h"
#import "SideTabViewController.h"
#import "SermonDetailViewController.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

@synthesize mainView, menuOpen;

#pragma mark - UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.tabBarItem.title = NSLocalizedString(@"Learn", @"Learn");
        self.tabBarItem.image = [UIImage imageNamed:@"Learn Icon"];
        
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuButton.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuTapped)];
        self.navigationItem.leftBarButtonItem = menuButton;
        UIImage *image = [UIImage imageNamed:@"navbartitledeepershadow2.png"];
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    }
    return self;
}

- (void)viewDidLoad
{
    //This sets the sideTab to send it's mainWindow messages to this instance of the LearnView.
    sideTab.mainWindow = self;
    sermonViewController.mainWindow = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    //Sets the menu to be opened at launch.
    [self menuTapped];
}

#pragma mark 
#pragma mark - Side Tab

-(void)animationDidStop:(NSString *)animationID
               finished:(NSNumber *)finished
                context:(void *)context
{
    if ([animationID isEqualToString:@"slideMenu"]){
        UIView *sq = (__bridge UIView *) context;
        [sq removeFromSuperview];
    }
}

- (void)menuTapped
{
    CGRect frame = self.mainView.frame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector( animationDidStop:finished:context: )];
    [UIView beginAnimations:@"slideMenu" context:(__bridge void *)(self.mainView)];
    
    if(menuOpen) {
        frame.origin.x = 0;
        menuOpen = NO;
    }
    else
    {
        frame.origin.x = 105;
        [self setMenuOpen:YES];
    }
    
    self.mainView.frame = frame;
    [UIView commitAnimations];
}

- (void)navMenuItemTapped
{
    //Crash if you select the sermon, select a detail, tap to menu, select a sermon.
    if (!sermonViewController)
        sermonViewController = [[SermonViewController alloc] initWithNibName:@"SermonView"
                                                                      bundle:nil];
    [self.mainView addSubview:sermonViewController.view];
    NSLog(@"%@", [sermonViewController description]);
    [self menuTapped];
}

//not using
/*
- (void)viewControllerSelectedToPush:(UIViewController*)view Animated:(BOOL)b
{
    if (!sermonDetailViewController) {
        sermonDetailViewController = [[SermonDetailViewController alloc] initWithNibName:@"SermonViewController"
                                                                                      bundle:nil];
    }
    [self.navigationController pushViewController:sermonDetailViewController animated:YES];
    if(menuOpen)
        [self menuTapped];
    
}*/

@end
