//
//  PreferencesViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 1/18/13.
//
//

#import "PreferencesViewController.h"

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
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *sermonStyle = [prefs objectForKey:@"sermonSeriesLayout"];
    if (sermonStyle == @"Collection")
    {
        segmentedSermonSeriesPref.selectedSegmentIndex = 1;
    }
    else segmentedSermonSeriesPref.selectedSegmentIndex = 0;
}

- (void)handleSegment
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if (segmentedSermonSeriesPref.selectedSegmentIndex == 0){
        
        [prefs setObject:@"Table" forKey:@"sermonSeriesLayout"];
        [prefs synchronize];
        NSLog(@"%@", [prefs objectForKey:@"sermonSeriesLayout"]);
    }
    else if (segmentedSermonSeriesPref.selectedSegmentIndex == 1){
        NSLog(@"set plist item to collection");
        [prefs setObject:@"Collection" forKey:@"sermonSeriesLayout"];
        [prefs synchronize];
    }

}
@end
