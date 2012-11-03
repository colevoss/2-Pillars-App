//
//  Sermons.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 9/24/12.
//
//

#import <Foundation/Foundation.h>

@interface Sermons : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentString;
}

@property (nonatomic, weak) id parentParserDelegate;

@property NSString *seriesTitle;
@property NSString *sermonTitle;
@property NSString *byWho;
@property NSString *date;
//@property UIImage *sermonImage;

@end
