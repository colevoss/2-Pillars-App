//
//  SermonViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 10/5/12.
//
//

#import <UIKit/UIKit.h>

@interface SermonViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
{
    NSArray *tableList;
    UITableView *table;
    IBOutlet UIView *background;
    

}
@property (strong, nonatomic) UIWindow *window;
@property IBOutlet UILabel *sermonDescription;
@property IBOutlet UIImageView *sermonImage;

@end