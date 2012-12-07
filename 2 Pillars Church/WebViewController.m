//
//  WebViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 11/15/12.
//
//

#import "WebViewController.h"

@interface WebViewController ()

@end


@implementation WebViewController
@synthesize web, websiteURL, viewTitle;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        
        self.title = viewTitle;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *URL = [[NSURL alloc] initWithString:websiteURL];
    [web loadRequest:[[NSURLRequest alloc] initWithURL:URL]];
}

@end
