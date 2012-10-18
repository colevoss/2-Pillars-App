//
//  SermonCustomCell.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 10/10/12.
//
//

#import <UIKit/UIKit.h>

@interface SermonCustomCell : UITableViewCell
{
    IBOutlet UILabel *sermonTitle;
    IBOutlet UILabel *sermonDate;
}

@property IBOutlet UILabel *sermonTitle;
@property IBOutlet UILabel *sermonDate;
@end
