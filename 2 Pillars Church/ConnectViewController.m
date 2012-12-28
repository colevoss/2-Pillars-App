//
//  SecondViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConnectViewController.h"
#import "WebViewController.h"
#import "InfoViewController.h"
#import "Why2PCViewController.h"
#import "MissionViewController.h"
#import "LeadersViewController.h"
#import "TestimonialsViewController.h"

@interface ConnectViewController ()

@end

@implementation ConnectViewController

@synthesize window, plazaAlertHasBeenShown;

#pragma mark -

- (void)viewDidLoad
{
    tableList = [[NSArray alloc] initWithObjects:@"The Plaza!",@"The City!", @"Information!", @"Testimonials!", nil];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    tableList = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Connect", @"Connect");
        self.tabBarItem.image = [UIImage imageNamed:@"i"];
    }
    return self;
}

#pragma mark - UITableView Data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [tableList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    [[cell textLabel] setText:[tableList objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //** THE PLAZA **//
    if ([tableList objectAtIndex:indexPath.row] == @"The Plaza!")
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        WebViewController *webView = [[WebViewController alloc] initWithNibName:@"WebViewController"
                                                                         bundle:nil];
        [webView setWebsiteURL:@"http://www.2pillars.onthecity.org/plaza"];
        [webView setViewTitle:@"The Plaza"];
        UINavigationController *webNav = [[UINavigationController alloc] initWithRootViewController:webView];
        webNav.navigationBar.barStyle = UIBarStyleBlack;
        webNav.delegate = self;
        
        [self presentModalViewController:webNav animated:YES];
        if (plazaAlertHasBeenShown == NO)
        {
            info = [[UIAlertView alloc] initWithTitle:@"The Plaza!"
                                                       message:@"Welcome to our online event calendar. Please check out any upcoming events!"
                                                      delegate:self
                                             cancelButtonTitle:@"Okay!"
                                             otherButtonTitles:@"Stop this message", nil];
            [info setDelegate:self];
            [info show];
            [self setPlazaAlertHasBeenShown:YES];
        }
    }

    //** INFORMATION **//
    else if ([tableList objectAtIndex:indexPath.row] == @"Information!")
    {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        
        //** Main Info Tab **//
        InfoViewController *infoView = [[InfoViewController alloc] init];
        UINavigationController *infoNav = [[UINavigationController alloc] initWithRootViewController:infoView];
        infoNav.navigationBar.barStyle = UIBarStyleBlack;
        infoNav.delegate = self;
        
        
        //** Why 2 PC **//
        Why2PCViewController *why2PCView = [[Why2PCViewController alloc] init];
        UINavigationController *whyNav = [[UINavigationController alloc] initWithRootViewController:why2PCView];
        whyNav.navigationBar.barStyle = UIBarStyleBlack;
        whyNav.delegate = self;
        
        //** Mission **//
        MissionViewController *missionView = [[MissionViewController alloc] init];
        UINavigationController *missionNav = [[UINavigationController alloc] initWithRootViewController:missionView];
        missionNav.navigationBar.barStyle = UIBarStyleBlack;
        missionNav.delegate = self;
        
        //** Leaders **// collection view
        LeadersViewController *leadersView = [[LeadersViewController alloc] init];
        UINavigationController *leadersNav = [[UINavigationController alloc] initWithRootViewController:leadersView];
        leadersNav.navigationBar.barStyle = UIBarStyleBlack;
        leadersNav.delegate = self;
        
        //** Tab Bar set up **//
        UITabBarController *tabBar = [[UITabBarController alloc] init];
        NSArray *tabButtonArray = [[NSArray alloc] initWithObjects:infoNav, whyNav, missionNav, leadersNav, nil];
        tabBar.viewControllers = tabButtonArray;
        self.window.rootViewController = tabBar;
        
        [self presentModalViewController:tabBar animated:YES];
        tabButtonArray = nil;
        infoNav = nil;
        infoView = nil;
        why2PCView = nil;
        whyNav = nil;
        missionView = nil;
        missionNav = nil;
        leadersNav = nil;
        leadersView = nil;
        
    }
    else if ([tableList objectAtIndex:indexPath.row] == @"The City!")
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        WebViewController *webView = [[WebViewController alloc] initWithNibName:@"WebViewController"
                                                                         bundle:nil];
        [webView setWebsiteURL:@"http://www.2pillars.onthecity.org"];
        NSString *titleString = [NSString stringWithFormat:@"The City"];
        [webView setViewTitle:titleString];
        UINavigationController *webNav = [[UINavigationController alloc] initWithRootViewController:webView];
        webNav.navigationBar.barStyle = UIBarStyleBlack;
        webNav.delegate = self;
        
        [self presentModalViewController:webNav animated:YES];
    }
    else if ([tableList objectAtIndex:indexPath.row] == @"Testimonials!")
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        TestimonialsViewController *tvController = [[TestimonialsViewController alloc] initWithNibName:@"TestimonialsViewController"
                                                                                                bundle:nil];
        
        UINavigationController *tvNav = [[UINavigationController alloc] initWithRootViewController:tvController];
        tvNav.navigationBar.barStyle = UIBarStyleBlack;
        tvNav.delegate = self;
        
        [self presentModalViewController:tvNav animated:YES];
    }
    else {
        //If an entry is not properly programmed, this alert will appear to prevent crashes
        NSString *alertRow = [NSString stringWithFormat:@"'%@' has not been programmed yet", [tableList objectAtIndex:indexPath.row]];
        UIAlertView *selectionIsNotProgrammedAlert = [[UIAlertView alloc] initWithTitle:@"Woops!"
                                                                                message:alertRow
                                                                               delegate:self
                                                                      cancelButtonTitle:@"Okay"
                                                                      otherButtonTitles:nil];
        [selectionIsNotProgrammedAlert show];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == info && buttonIndex == 1)
    {
        
        //This needs work. We are setting the second button on the plaza alert to store a bool value to the plist
        //so that the alert never comes back again.
        NSString *plistFile = [[NSBundle mainBundle] pathForResource:@"2 Pillars Church-Info"
                                                         ofType:@"plist"];
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:plistFile];
        NSMutableDictionary *subDict = [[dict objectForKey:@"Plaza Alert"] mutableCopy];
        [subDict setObject:[NSNumber numberWithBool:TRUE] forKey:@"Plaza Alert"];
        [dict setObject:subDict forKey:@"Plaza Alert"];
        NSLog(@"I don't think this is working.");
    }
}

@end