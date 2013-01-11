//
//  BlogViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 1/10/13.
//
//

#import <UIKit/UIKit.h>

@class LearnViewController;

@interface BlogViewController : UIViewController
{
    LearnViewController *mainWindow;
}
@property (assign, readwrite) LearnViewController *mainWindow;

@end
