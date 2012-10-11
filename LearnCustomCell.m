//
//  CustomCell.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 9/24/12.
//
//

#import "LearnCustomCell.h"

@implementation LearnCustomCell

@synthesize sermonImage, sermonTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
