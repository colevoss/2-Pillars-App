//
//  SecondViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize window;

#pragma mark -

- (void)viewDidLoad
{
    //Need to define what will be in this list.
    tableList = [[NSArray alloc] initWithObjects:@"Info1", @"Info2", nil];
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
        self.title = NSLocalizedString(@"Info", @"Info");
        self.tabBarItem.image = [UIImage imageNamed:@"i"];
    }
    
    //Create the nav controller for this ViewController
    
    //NEEDS WORK
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self];
    [navController setTitle:@"Info"];
    self.window.rootViewController = navController;
    
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
    //Set what happens when an item is selected
    
}

@end