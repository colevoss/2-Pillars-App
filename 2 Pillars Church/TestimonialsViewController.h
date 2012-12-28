//
//  TestimonialsViewController.h
//  2 Pillars Church 2.0
//
//  Created by Cole Voss on 12/28/12.
//
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface TestimonialsViewController : UITableViewController
{
    NSArray *tableList;
}
@property (strong, nonatomic) MPMoviePlayerController *player;

@end
