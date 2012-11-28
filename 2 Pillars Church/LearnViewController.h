//
//  FirstViewController.h
//  2 Pillars Church
//
//  Created by Blaine Kasten on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LearnCustomCell;
@class SermonParser;

@interface LearnViewController :  UIViewController <UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate>
{
    NSMutableData *xmlData;
    NSURLConnection *connection;
    SermonParser *channel;
    
    NSArray *tableList;
    LearnCustomCell *cell;
}

@end
