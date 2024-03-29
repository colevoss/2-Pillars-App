//
//  MoreViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/10/12.
//  Copyright (c) 2012 vkdevs. All rights reserved.
//

#import "MoreViewController.h"
#import "MapViewController.h"
#import "WebViewController.h"
#import "PreferencesViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

#pragma mark -

- (void)viewDidLoad
{
    tableList = [[NSArray alloc] initWithObjects:@"Map", @"Preferences", nil];
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
        self.title = NSLocalizedString(@"More", @"More");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    } return self;
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
    //Set's the cell's textlabel to the name of the object at index.

    [[cell textLabel] setText:[tableList objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[tableList objectAtIndex:indexPath.row] isEqual: @"Map"])
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        MapViewController *mapView = [[MapViewController alloc] initWithNibName:@"MapViewController"
                                                                         bundle:nil];
        UINavigationController *mapNav = [[UINavigationController alloc] initWithRootViewController:mapView];
        mapNav.delegate = self;
        
        [self presentModalViewController:mapNav animated:YES];
        mapNav.delegate = nil;
    }
    

    else if ([[tableList objectAtIndex:indexPath.row] isEqual: @"Preferences"])
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        PreferencesViewController *prefView = [[PreferencesViewController alloc] initWithNibName:@"PreferencesViewController"
                                                                                          bundle:nil];
        UINavigationController *prefNav = [[UINavigationController alloc] initWithRootViewController:prefView];
        prefNav.delegate = self;
        
        [self presentModalViewController:prefNav animated:YES];
        prefNav.delegate = nil;
    }


/*
    Add other selections here before the else statement.
    else if ([tableList objectAtIndex:indexPath.row] == @"")
*/
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
