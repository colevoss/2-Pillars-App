//
//  MoviePlayerController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 12/29/12.
//
//

#import "MoviePlayerController.h"

@implementation MoviePlayerController

@synthesize player;

- (id)initWithContentURL:(NSURL *)url
{
    self = [super initWithContentURL:url];
    if (self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [player prepareToPlay];
    [player setFullscreen:YES animated:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:player];
    [player play];
}

- (void) playerFinishedCallback:(NSNotification *)aNotification
{
    //This gets called when the video finishes.
    //We remove the observer, and remove the view.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:player];
    [player.view removeFromSuperview];
    
    player = nil;
}

// Deprecated in iOS6, still needed for iOS5 support.
// ---
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}


// iOS6 support
// ---
-(BOOL)shouldAutorotate
{
    return YES;
}
- (NSUInteger)application:(UIApplication*)application
supportedInterfaceOrientationsForWindow:(UIWindow*)window
{
    return (UIInterfaceOrientationMaskLandscape);
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

//

@end
