//
//  SermonCustomCell.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 10/10/12.
//
//

#import "SermonCustomCell.h"

@implementation SermonCustomCell

@synthesize sermonTitle, sermonDate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SermonCustomCell.xib"
//                                                                   owner:self
//                                                               options:nil];
    
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
