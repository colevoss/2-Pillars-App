//
//  CustomCell.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 9/24/12.
//
//

#import <UIKit/UIKit.h>

@interface LearnCustomCell : UITableViewCell
{
    IBOutlet UILabel *sermonTitle;
    IBOutlet UIImageView *sermonImage;
}

@property IBOutlet UILabel *sermonTitle;
@property (nonatomic) IBOutlet UIImageView *sermonImage;

@end
