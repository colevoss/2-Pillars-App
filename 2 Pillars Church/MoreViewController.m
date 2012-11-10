//
//  MoreViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"
#import "MapViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

#pragma mark -

- (void)viewDidLoad
{
    //Need to define what will be in this list.
    tableList = [[NSArray alloc] initWithObjects:@"Directions here!", nil];
    
    NSLog(@"# Of objects in MoreViewController's tableList = %i", [tableList count]);
    [super viewDidLoad];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    //Set the tableList to nil when leaving so it can release it.
    tableList = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //initiate the tab with the image buttons and title
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"More", @"More");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
    
}

#pragma mark - UITableView Data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Number of rows in the table will equal
    // the tableList array that is made up of the
    return [self->tableList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Deallocates Memory for table cells not on screen.
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
    NSString *selected = [tableList objectAtIndex:indexPath.row];
    if (selected == @"Directions here!")
    {
        NSLog(@"clicked on map");
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        MapViewController *mapView = [[MapViewController alloc] initWithNibName:@"MapViewController"
                                                                         bundle:nil];
        UINavigationController *mapNav = [[UINavigationController alloc] initWithRootViewController:mapView];
        mapNav.delegate = self;
        
        //NEEDS WORK, SHOULD BE LOADING ONLY SHOWING
        MKCoordinateRegion regionForViewToShow = MKCoordinateRegionMake(CLLocationCoordinate2DMake(40.79192, -96.700295), MKCoordinateSpanMake(10,10));
        [mapView.map setRegion:regionForViewToShow animated:YES];
        
        [self presentModalViewController:mapNav animated:YES];
        mapNav.delegate = nil;
    }
    //Add other selections here before the else statement.
    
    else [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



@end
