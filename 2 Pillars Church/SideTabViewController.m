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
    if ([tableList objectAtIndex:indexPath.row] == @"Sermons") {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //1 represents Sermons
        [self.mainWindow navMenuItemTapped:1];
    }
    else {
    //If an entry is not properly programmed, this alert will appear to prevent crashes
        NSString *alertRow = [NSString stringWithFormat:@"'%@' has not been programmed yet", [tableList objectAtIndex:indexPath.row]];
        UIAlertView *selectionIsNotProgrammedAlert = [[UIAlertView alloc]   initWithTitle:@"Woops!"
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
