//
//  MoreViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SermonDetailViewController.h"
#import "SermonCustomCell.h"

@interface SermonDetailViewController ()

@end

@implementation SermonDetailViewController

@synthesize sermonImage, sermonDescription;

#pragma mark -
#pragma mark - Initializers

- (void)viewDidLoad
{
    //Need to define what will be in this list.
    tableList = [[NSArray alloc] initWithObjects:@"Nehemiah 1:11", @"Nehemiah 2:1", @"Test", @"Test Again", @"More Testing",nil];
    
    background.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundMatte.jpeg"]];
    [sermonDescription setTextColor:[UIColor blackColor]];
    [[self sermonDescription] setText:@"The Sermon on the mount\n is a study on Jesus \nteachings in Mathew 5-7. \nHere we learn about \nwhat it means to be \na follower of Christ."];
    [[self sermonImage] setImage:[UIImage imageNamed:@""]];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    //Set the tableList to nil when leaving so it can release it.
    tableList = nil;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //initiate the tab with the image buttons and title
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Nehemiah", "Nehemiah");
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
    //I think later on, it may be cool to have the background be hosted
    //online, and retrieve that for each sermon view

    
    static NSString *CellIdentifier = @"Cell";
    SermonCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_rust-circle.png"]];
    
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SermonCustomCell" owner:self options:nil];
        
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    
<<<<<<< HEAD
=======
//    if (cell == nil){
//        cell = [[SermonCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        
//
//    }
    

        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_back_full_solid.png"]];
>>>>>>> New Cell Design in SermonCustomCell view
    
    [[cell sermonTitle] setText:[tableList objectAtIndex:indexPath.row]];
    [[cell sermonDate] setText:@"Oct. 12, 2012"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Other Methods



@end
