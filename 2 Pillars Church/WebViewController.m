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
@synthesize web, websiteURL, viewTitle, loadSpinner;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        
        self.loadSpinner.hidesWhenStopped = YES;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //create spinner obj
    loadSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];

    //assign what URL to on viewDidLoad.
    NSURL *URL = [[NSURL alloc] initWithString:websiteURL];
    [web loadRequest:[[NSURLRequest alloc] initWithURL:URL]];

    //set title
    self.title = viewTitle;

    //Add spinner to nav bar
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:loadSpinner];

}

#pragma mark - webView methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //start spinner
    [loadSpinner startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //stop spinner
    [loadSpinner stopAnimating];
}

@end
