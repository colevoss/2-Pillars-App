//
//  SermonTabViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 12/5/12.
//
//

#import <UIKit/UIKit.h>
@class SermonParser, LearnCustomCell, LearnViewController, SermonDetailViewController;

@interface SermonViewController : UIViewController <UITableViewDataSource, UITableViewDataSource, NSXMLParserDelegate>
{
    //WebParsing iVars
    NSMutableData *xmlData;
    NSURLConnection *connection;
    SermonParser *channel;
    
    //tableView ivars
    NSArray *tableList;
    LearnCustomCell *cell;
    
    LearnViewController *mainWindow;
    SermonDetailViewController *detailViewController;
}

@property (assign, readwrite) LearnViewController *mainWindow;
@property (strong, nonatomic) SermonDetailViewController *detailViewController;
@end
