//
//  LeadersViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 11/23/12.
//
//

#import "LeadersViewController.h"

@implementation LeadersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        self.title = NSLocalizedString(@"Leaders", @"Leaders");
    }
    return self;
}

- (void)viewDidLoad
{
    tableList = [[NSArray alloc] initWithObjects:@"Todd Bumgarner", @"Adam Stahr", @"Cheech Sorilla", @"Matt Grant", nil];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    tableList = nil;
    [super viewDidUnload];
}

#pragma mark
#pragma mark - Table view data source

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell.textLabel setTextColor:[UIColor whiteColor]];
    }
    
    [[cell textLabel] setText:[tableList objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark
#pragma mark - Table view delegate

@end
