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
        if (_map) _map = [[MKMapView alloc] init];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        
        //not sure if this is cool.
        self.navigationItem.title = NSLocalizedString(@"2 Pillars Church", @"2 Pillars Church");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CLLocationCoordinate2D churchLocation = CLLocationCoordinate2DMake(40.79192, -96.700295);
    [self.map setRegion:MKCoordinateRegionMake(churchLocation, MKCoordinateSpanMake(.05, .05)) animated:YES];
    MKPointAnnotation *churchPin = [[MKPointAnnotation alloc] init];
    [churchPin setCoordinate:churchLocation];
    [churchPin setTitle:@"2 Pillars Church"];
    [churchPin setSubtitle:@"1430 South Street #110 Lincoln, NE 68502"];
    [_map addAnnotation:churchPin];
    [_map selectAnnotation:churchPin animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
