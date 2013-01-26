//
//  PreferencesViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 1/18/13.
//
//

#import <UIKit/UIKit.h>

@class SermonaViewController;

@interface PreferencesViewController : UIViewController
{
    IBOutlet UISegmentedControl *segmentedSermonSeriesPref;
    SermonaViewController *collectionPrefDelegate;
    
    NSUserDefaults *prefs;
}

@property (assign, readwrite) SermonaViewController *collectionPrefDelegate;

@end
