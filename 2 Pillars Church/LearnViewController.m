//
//  FirstViewController.m
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LearnViewController.h"
#import "SermonViewController.h"
#import "LearnCustomCell.h"
#import "Sermons.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

//@synthesize tmpCell;

#pragma mark - UIViewController

- (void)viewDidLoad
{
    //Later this list should be populated by what is parsed from the website.
    Sermons *nehemiah = [[Sermons alloc] init];
    [nehemiah setSermon:@"Nehemiah"];
    [nehemiah setSermonImage:[UIImage imageNamed:@"1.png"]];
    
    Sermons *sermonOnTheMount = [[Sermons alloc] init];
    [sermonOnTheMount setSermon:@"The Sermon On the Mount"];
    [sermonOnTheMount setSermonImage:[UIImage imageNamed:@"1.png"]];
    
    Sermons *theStoryOfGod = [[Sermons alloc] init];
    [theStoryOfGod setSermon:@"The Story Of God"];
    [theStoryOfGod setSermonImage:[UIImage imageNamed:@"1.png"]];
    
    //Need to change this array to load these sermon objects.
//    tableList = [[NSArray alloc] initWithObjects:nehemiah, sermonOnTheMount, theStoryOfGod, nil];
    
    tableList = [[NSArray alloc] initWithObjects:@"Nehemiah", @"The Sermon On The Mount", @"The Story of God", nil];


    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    //Set Array to nil when we leave the view so it can be deallocated.
    tableList = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //initiate the tab with the image buttons and title
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        self.tabBarItem.title = NSLocalizedString(@"Learn", @"Learn");
        self.tabBarItem.image = [UIImage imageNamed:@"Learn Icon"];
        self.title = NSLocalizedString(@"Learn", "Learn");
    }
    
    return self;

}

#pragma mark
#pragma mark - UITableView Data source

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Number of rows in the table will equal
    // the tableList array that is made up of the
    return [tableList count];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61.2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_rust-circle.png"]];

    //Creating the cells from customcell.h
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LearnCustomCell"
                                                                 owner:nil
                                                               options:nil];
        for (id currentObject in topLevelObjects)
        {
            cell = (LearnCustomCell *)currentObject;
            break;
        }
        
    }
    
    //These need to be fixed to load from the Sermon object temporarily created in viewdidload
    [[cell sermonTitle] setText:[tableList objectAtIndex:indexPath.row]];
    [[cell imageView] setImage:[UIImage imageNamed:@"1.png"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SermonViewController *vc = [[SermonViewController alloc] initWithNibName:@"SermonViewController"
                                                                      bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

@end
