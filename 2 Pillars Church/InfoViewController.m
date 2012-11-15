//
//  SecondViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"
#import "WebViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize window;

#pragma mark -

- (void)viewDidLoad
{
    tableList = [[NSArray alloc] initWithObjects:@"The Plaza!", nil];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    tableList = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Info", @"Info");
        self.tabBarItem.image = [UIImage imageNamed:@"i"];
    }
    return self;
}

#pragma mark - UITableView Data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Number of rows in the table will equal
    // the tableList array that is made up of the
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
    }
    
    else
    {
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

@end