//
//  SideTabViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 12/5/12.
//
//

#import "SideTabViewController.h"
#import "LearnViewController.h"



@implementation SideTabViewController

@synthesize mainWindow = _mainWindow;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    tableList = [[NSArray alloc] initWithObjects:@"Sermons", @"Music", @"Blogs", nil];
    
    [super viewDidLoad];
}


#pragma mark - Table view data source

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
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    
//    [[cell imageView] setImage:[tableList objectAtIndex:indexPath.row]];
    [[cell textLabel] setText:[tableList objectAtIndex:indexPath.row]];
    [[cell textLabel] setTextColor:[UIColor grayColor]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.mainWindow navMenuItemTapped];
}

@end
