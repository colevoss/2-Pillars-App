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
#import "SermonParser.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

//@synthesize tmpCell;

#pragma mark - UIViewController

- (void)viewDidLoad
{
    //Later this list should be populated by what is parsed from the website.
    
    tableList = [[NSArray alloc] initWithObjects:@"Nehemiah", @"The Sermon On The Mount", @"The Story of God", @"The Gospel &...", @"Vision Series", @"Misc Teachings",  nil];
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
        [self fetchEntries];
    }
    
    return self;

}

#pragma mark
#pragma mark - UITableView Data source

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
        
        // Set the parser's delegate to the channel object - ignore this warning for now
        [parser setDelegate:channel];
    }
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    // Add the incoming chunk of data to the container we are keeping
    // The data always comes in the correct order
    [xmlData appendData:data];
    NSLog(@"%@", xmlData);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    // Create the parser object with the data received from the web service
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    
    // Give it a delegate
    [parser setDelegate:self];
    
    // Tell it to start parsing - the document will be parsed and
    // the delegate of NSXMLParser will get all of its delegate messages
    // sent to it before this line finishes execution - it is blocking
    [parser parse];
    
    // Get rid of the XML data as we no longer need it
    xmlData = nil;
    
    // Get rid of the connection, no longer need it
    connection = nil;
    
    NSLog(@"%@\n %@\n %@\n", channel, [channel seriesTitle], [channel sermonTitle]);
}

- (void)connection:(NSURLConnection *)conn
  didFailWithError:(NSError *)error
{
    connection = nil;
    xmlData = nil;
    
    // Grab the description of the error object passed to us
    NSString *errorString = [NSString stringWithFormat:@"Fetch failed: %@",
                             [error localizedDescription]];
    
    // Create and show an alert view with this error displayed
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
                                                 message:errorString
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
    [av show];
}

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
    
    //When the web server is working, implement these to set the 
//    Sermons *sermonItem = [[channel items] objectAtIndex:[indexPath row]];
//    [[cell sermonTitle] setText:[sermonItem seriesTitle];
    [[cell sermonTitle] setText:[tableList objectAtIndex:indexPath.row]];
    [[cell imageView] setImage:[UIImage imageNamed:@"1.png"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SermonViewController *vc = [[SermonViewController alloc] initWithNibName:@"SermonViewController"
                                                                      bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    self.tabBarItem.title = NSLocalizedString(@"Nehemiah", @"Nehemiah");
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

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

@end
