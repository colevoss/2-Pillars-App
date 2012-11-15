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
@interface Annotation : NSObject <MKAnnotation>
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (id)initWithLocation:(CLLocationCoordinate2D)coord;
@end

@implementation Annotation
@synthesize coordinate;
- (id)initWithLocation:(CLLocationCoordinate2D)coord
{
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}
@end

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
    Annotation *pin = [[Annotation alloc] initWithLocation:churchLocation];
    [_map addAnnotation:pin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
