//
//  SermonaViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 1/10/13.
//
//

#import <UIKit/UIKit.h>

@class LearnViewController;
@class SermonDetailViewController;

@interface SermonaViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    NSArray *sermonList;
    
    LearnViewController *mainWindow;    
    SermonDetailViewController *detailViewController;    
}

@property(nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (assign, readwrite) LearnViewController *mainWindow;
@property (strong, nonatomic) SermonDetailViewController *detailViewController;

@end
