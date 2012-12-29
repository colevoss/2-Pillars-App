//
//  TestimonialsViewController.m
//  2 Pillars Church 2.0
//
//  Created by Cole Voss on 12/28/12.
//
//

#import "TestimonialsViewController.h"
#import "MoviePlayerController.h"

@interface TestimonialsViewController ()

@end


@implementation TestimonialsViewController

@synthesize player;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewControllerAnimated:)];
        self.title = NSLocalizedString(@"Testimonies", @"Testimonies");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableList = [[NSArray alloc] initWithObjects:@"Anthony Estrada", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    tableList = nil;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [[cell textLabel] setText:[tableList objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSURL *movieURL = [[NSBundle mainBundle] URLForResource:@"Anthony" withExtension:@"mp4"];
    MoviePlayerController *movie = [[MoviePlayerController alloc] initWithContentURL:movieURL];
    [movie setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentMoviePlayerViewControllerAnimated:movie];

}



@end
