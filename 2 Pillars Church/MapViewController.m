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
        
        //NEEDS WORK, SHOULD BE LOADING ONLY SHOWING
        MKCoordinateRegion regionForViewToShow = MKCoordinateRegionMake(CLLocationCoordinate2DMake(40.79192, -96.700295), MKCoordinateSpanMake(100,100));
        [_map setRegion:regionForViewToShow];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
