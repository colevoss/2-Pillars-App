//
//  PreferencesViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 1/18/13.
//
//

#import "PreferencesViewController.h"
#import "SermonaViewController.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        self.navigationItem.title = @"Preferences";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [segmentedSermonSeriesPref addTarget:self
                                  action:@selector(handleSegment)
                        forControlEvents:UIControlEventValueChanged];
    
    prefs = [NSUserDefaults standardUserDefaults];

    //if iOS 5, Table view is the only option because it doesn't respond to collections
    if([collectionPrefDelegate respondsToSelector:@selector(collectionView)])
    {
        segmentedSermonSeriesPref.selectedSegmentIndex = 0;
        [segmentedSermonSeriesPref setEnabled:NO];
    }
    else {
        if ([prefs boolForKey:@"sermonSeriesLayout"] == YES)
        {
            segmentedSermonSeriesPref.selectedSegmentIndex = 1;
        }
        else segmentedSermonSeriesPref.selectedSegmentIndex = 0;
    }
    
}

- (void)handleSegment
{
    if (segmentedSermonSeriesPref.selectedSegmentIndex == 0){
        [prefs setBool:NO forKey:@"sermonSeriesLayout"];
        [prefs synchronize];
    }
    else if (segmentedSermonSeriesPref.selectedSegmentIndex == 1){
        [prefs setBool:YES forKey:@"sermonSeriesLayout"];
        [prefs synchronize];
    }

}
@end
