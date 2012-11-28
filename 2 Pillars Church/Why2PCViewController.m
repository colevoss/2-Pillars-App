//
//  Why2PCViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 11/15/12.
//
//

#import "Why2PCViewController.h"

@implementation Why2PCViewController

@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        self.title = NSLocalizedString(@"Why '2 Pillars'", @"Why '2 Pillars'");
    }
    return self;
}

@end
