//
//  SermonaViewController.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 1/10/13.
//
//

#import "SermonDetailViewController.h"
#import "SermonaViewController.h"
#import "LearnViewController.h"
#import "Sermons.h"
#import "cellView.h"



@interface SermonaViewController ()

@end

@implementation SermonaViewController

NSString *kcellID = @"cellID";

@synthesize mainWindow = _mainWindow;
@synthesize detailViewController = _detailViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; i++){
        Sermons *sermon = [[Sermons alloc] init];
        [items addObject:sermon];
    }
    
    sermonList = [[NSArray alloc] initWithObjects:items, nil];
   [self.collectionView registerClass:[cellView class] forCellWithReuseIdentifier:kcellID];
    
    detailViewController = [[SermonDetailViewController alloc] initWithNibName:@"SermonViewController"
                                                                        bundle:nil];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)view
     numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    cellView *cell = (cellView *)[cv dequeueReusableCellWithReuseIdentifier:kcellID
                                                               forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    cell.image.image = [UIImage imageNamed:@"1.png"];
    [cell.contentView addSubview:cell.image];
    return cell;

}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    return [[UICollectionReusableView alloc] init];
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mainWindow.navigationController pushViewController:detailViewController
                                                    animated:YES];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}



#pragma mark – UICollectionViewDelegateFlowLayout

//// 1
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    CGSize retval = CGSizeMake(150, 150);
//    return retval;
//}
//
//- (UIEdgeInsets)collectionView:
//(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(10, 1, 1, 1);
//
//}

@end
