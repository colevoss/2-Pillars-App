//
//  WebViewController.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 11/15/12.
//
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
{
    NSString *websiteURL;
}

@property (nonatomic, retain) IBOutlet UIWebView *web;
@property (nonatomic, strong) NSString *websiteURL;
@property (nonatomic, strong) NSString *viewTitle;


@end
