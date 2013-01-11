//
//  Sermons.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 9/24/12.
//
//

#import "Sermons.h"

@implementation Sermons
@synthesize seriesTitle = _seriesTitle;
@synthesize sermonTitle = _sermonTitle;
@synthesize byWho = _byWho;
@synthesize date = _date;
@synthesize sermonImage = _sermonImage;

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"sermontitle"]) {
        currentString = [[NSMutableString alloc] init];
        [self setSermonTitle:currentString];
    }
    else if ([elementName isEqual:@"bywho"]) {
        currentString = [[NSMutableString alloc] init];
        [self setByWho:currentString];
    }
    else if ([elementName isEqual:@"date"]) {
        currentString = [[NSMutableString alloc] init];
        [self setDate:currentString];
    }
    else if ([elementName isEqual:@"seriesTitle"]) {
        currentString = [[NSMutableString alloc] init];
        [self setSeriesTitle:currentString];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)str
{
    [currentString appendString:str];
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    currentString = nil;
    
    if ([elementName isEqual:@"seriesTitle"])
        [parser setDelegate:_parentParserDelegate];
}

@end
