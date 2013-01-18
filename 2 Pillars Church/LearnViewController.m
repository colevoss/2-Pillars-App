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
#import "BlogViewController.h"
#import "MusicViewController.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

@synthesize mainView, menuOpen, upSwipe, downSwipe;

#pragma mark - UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.tabBarItem.title = NSLocalizedString(@"Learn", @"Learn");
        self.tabBarItem.image = [UIImage imageNamed:@"Learn Icon"];
        
        UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuButton.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuTapped)];
        self.navigationItem.rightBarButtonItem = menuButton;
        UIImage *image = [UIImage imageNamed:@"navbartitledeepershadow2.png"];
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    }
    return self;
}

- (void)viewDidLoad
{

    //Views that we display
    sermonController = [[SermonViewController alloc]initWithNibName:@"SermonView" bundle:nil];
    blogController = [[BlogViewController alloc] initWithNibName:@"BlogViewController"
                                                          bundle:nil];
    musicController = [[MusicViewController alloc] initWithNibName:@"MusicViewController"
                                                            bundle:nil];

    //This sets each controller to allow this controller to manage their views.
    sermonController.mainWindow = self;
    blogController.mainWindow = self;
    musicController.mainWindow = self;
    

    //Gesture Recognizers
    [self.view addGestureRecognizer:self.upSwipe];
    [self.view addGestureRecognizer:self.downSwipe];
    
}

- (void)viewDidUnload
{
    sermonController = nil;
    blogController = nil;
    musicController = nil;
    upSwipe = nil;
    downSwipe = nil;
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
    CGRect frame = self.mainView.frame;
    if (frame.origin.y == 0)
        menuOpen = NO;
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
        frame.origin.y = 0;
        menuOpen = NO;
    }
    else
    {
        frame.origin.y = 44;
        menuOpen = YES;
    }
    
    self.mainView.frame = frame;
    [UIView commitAnimations];
}

- (IBAction)buttonPressed:(UIButton*)sender {
    //tag 0 == Sermons
    if (sender.tag == 0){
        [self.mainView addSubview:sermonController.view];
        [self menuTapped];
    }
    //tag 1 == Blog
    else if (sender.tag == 1){
        [self.mainView addSubview:blogController.view];
        [self menuTapped];
    }
    //tag 2 == Music
    else if (sender.tag == 2){
        [self.mainView addSubview:musicController.view];
        [self menuTapped];
    }
    NSLog(@"%@", self.mainView.subviews.debugDescription);
}

#pragma mark
#pragma mark - Gesture Recognizers

- (IBAction)handleUpSwipe:(UISwipeGestureRecognizer *)sender {
    if (menuOpen == YES)
        [self menuTapped];
}

- (IBAction)handleDownSwipe:(UISwipeGestureRecognizer *)sender {
    if (menuOpen == NO)
        [self menuTapped];
}
@end
