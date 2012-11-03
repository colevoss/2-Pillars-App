//
//  SermonParser.h
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 10/18/12.
//
//

#import <Foundation/Foundation.h>

@interface SermonParser : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentString;
    
//    Website is not prepared to have an image parsed
//    UIImage *sermonImage;
}

@property (nonatomic, weak) id parentParserDelegate;
@property (nonatomic, readonly, strong) NSMutableArray *items;

@property NSString *seriesTitle;
@property NSString *byWho;
@property NSString *sermonTitle;
@property NSString *date;

@end
