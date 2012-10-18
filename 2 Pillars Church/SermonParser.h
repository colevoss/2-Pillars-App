//
//  SermonParser.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 10/18/12.
//
//

#import <Foundation/Foundation.h>

@interface SermonParser : NSXMLParser
{
    NSString *seriesTitle;
    NSString *byWho;
    NSString *sermonTitle;
    
//    Website is not prepared to have an image parsed
//    UIImage *sermonImage;
}

@property NSString *seriesTitle;
@property NSString *byWho;
@property NSString *sermonTitle;

@end
