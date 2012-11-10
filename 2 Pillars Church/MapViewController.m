//
//  MapViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 11/8/12.
//
//

#import "MapViewController.h"

//@interface MapViewController ()
//
//@end



@implementation MapViewController

@synthesize map = _map;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        
        //not sure if this is cool.
        self.navigationItem.title = NSLocalizedString(@"2 Pillars Address", @"2 Pillars Address");
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
