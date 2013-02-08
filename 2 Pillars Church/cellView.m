//
//  cell.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 1/10/13.
//
//

#import "cellView.h"


@implementation cellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //black frame
        self.backgroundColor = [UIColor blackColor];

        //orange background
        UIView *frame = [[UIView alloc] initWithFrame:CGRectMake(2.5, 2.5, 95, 95)];
        frame.backgroundColor = [UIColor colorWithRed:0.55686274509804 green:0.28627450980392 blue:0.01960784313725 alpha:0.88];
        [self addSubview:frame];


        //Image
        _image = [[UIImageView alloc] init];
        [self addSubview:_image];
        [_image setFrame:CGRectMake(5, 5, 90, 90)];

        [_image setImage:[UIImage imageNamed:@"1"]];
    }
    return self;
}
@end
