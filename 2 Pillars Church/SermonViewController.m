//
//  SermonTabViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 12/5/12.
//
//

#import "SermonViewController.h"
#import "LearnCustomCell.h"
#import "LearnViewController.h"
#import "SermonParser.h"
#import "SermonDetailViewController.h"
#import "SermonCustomCell.h"

@interface SermonViewController ()

@end

@implementation SermonViewController

@synthesize detailViewController;
@synthesize mainWindow = _mainWindow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self){
        [self fetchEntries];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableList = [[NSArray alloc] initWithObjects:@"Nehemiah", @"The Sermon On The Mount", @"The Story of God", @"The Gospel & ...", @"Vision Series", @"Miscellaneous", nil];
    detailViewController = [[SermonDetailViewController alloc] initWithNibName:@"SermonViewController" bundle:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    tableList = nil;

}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
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
    
    //Custom Cells
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
    
    //    When the web server is working, implement these to set the row title
    //    Sermons *sermonItem = [[channel items] objectAtIndex:[indexPath row]];
    //    [[cell sermonTitle] setText:[sermonItem seriesTitle];
    [[cell sermonTitle] setText:[tableList objectAtIndex:indexPath.row]];
    [[cell imageView] setImage:[UIImage imageNamed:@"1.png"]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mainWindow.navigationController pushViewController:detailViewController
                                               animated:YES];
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    NSLog(@"%@", [self presentedViewController]);
}

#pragma mark
#pragma mark - Parsing Methods

- (void)fetchEntries
{
    // Create a new data container for the stuff that comes back from the service
    xmlData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"blaine.macpractice.net/Pages/SermonXML"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    // Create a connection that will exchange this request for data from the URL
    connection = [[NSURLConnection alloc] initWithRequest:req
                                                 delegate:self
                                         startImmediately:YES];
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [xmlData appendData:data];
    NSLog(@"%@", xmlData);
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%@ found a %@ element", self, elementName);
    if ([elementName isEqual:@"channel"]) {
        
        // If the parser saw a channel, create new instance, store in our ivar
        channel = [[SermonParser alloc] init];
        
        // Give the channel object a pointer back to ourselves for later
        [channel setParentParserDelegate:self];
        
        // Set the parser's delegate to the channel object
        [parser setDelegate:channel];
    }
}

- (void)connection:(NSURLConnection *)conn
  didFailWithError:(NSError *)error
{
    connection = nil;
    xmlData = nil;
    
    NSString *errorString = [NSString stringWithFormat:@"Fetch failed: %@",
                             [error localizedDescription]];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                                 message:errorString
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    // Create the parser object with the data received from the web service
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    [parser setDelegate:self];
    [parser parse];
    
    xmlData = nil;
    connection = nil;
    
    NSLog(@"%@\n %@\n %@\n", channel, [channel seriesTitle], [channel sermonTitle]);
}


@end
