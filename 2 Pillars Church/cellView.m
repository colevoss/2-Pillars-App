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
        NSLog(@"%@", _image);
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(2.5, 2.5, 95, 95)];
        [view addSubview:_image];
//        _image.image = [UIImage imageNamed:@"1.png"];
        [self.contentView addSubview:view];
    }
    return self;
}
@end
