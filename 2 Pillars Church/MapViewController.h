//
//  MapViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 11/8/12.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *map;


@end
