//
//  InfoViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 11/15/12.
//
//

#import "AboutViewController.h"

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        self.title = @"About Us";
        self.tabBarItem.image = [UIImage imageNamed:@"i"];
    }
    return self;
}

@end
