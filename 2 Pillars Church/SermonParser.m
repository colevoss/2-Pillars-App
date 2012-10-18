//
//  SermonParser.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 10/18/12.
//
//

#import "SermonParser.h"

@implementation SermonParser
@synthesize seriesTitle = _seriesTitle;
@synthesize sermonTitle = _sermonTitle;
@synthesize byWho = _byWho;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{

}


@end
