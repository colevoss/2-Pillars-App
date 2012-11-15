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
    tableList = [[NSArray alloc] initWithObjects:@"The Plaza", nil];
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