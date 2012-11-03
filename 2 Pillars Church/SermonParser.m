//
//  SermonParser.m
//  2 Pillars Church 2.0
//
//  Created by Blaine Kasten on 10/18/12.
//
//

#import "SermonParser.h"
#import "Sermons.h"

@implementation SermonParser
@synthesize seriesTitle = _seriesTitle;
@synthesize sermonTitle = _sermonTitle;
@synthesize byWho = _byWho;
@synthesize date = _date;
@synthesize parentParserDelegate = _parentParserDelegate;
@synthesize items;

- (id)init
{
    self = [super init];
    
    if (self) {
        // Create the container for the RSSItems this channel has;
        // we'll create the RSSItem class shortly.
        items = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{    
    if ([elementName isEqualToString:@"sermontitle"]){
        if (!currentString)
            currentString = [[NSMutableString alloc] init];
        [self setSermonTitle:currentString];
    }
    
    if ([elementName isEqualToString:@"bywho"]){
        if (!currentString)
            currentString = [[NSMutableString alloc] init];
        [self setByWho:currentString];
    }
    
    if ([elementName isEqualToString:@"date"]){
        if (!currentString)
            currentString = [[NSMutableString alloc] init];
        [self setDate:currentString];
    }
    if ([elementName isEqualToString:@"seriestitle"]){
        if (!currentString)
            currentString = [[NSMutableString alloc] init];
        Sermons *sermon = [[Sermons alloc] init];
        [sermon setParentParserDelegate:self];
        [parser setDelegate:sermon];
        [items addObject:sermon];
    }
    
}

//When characters are found, they are appended to the currentString
- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)str
{
    [currentString appendString:str];
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    // If we were in an element that we were collecting the string for,
    // this appropriately releases our hold on it and the permanent ivar keeps
    // ownership of it. If we weren't parsing such an element, currentString
    // is nil already.
    currentString = nil;
    
    // If the element that ended was the channel, give up control to
    // who gave us control in the first place
    if ([elementName isEqual:@"seriestitle"])
        [parser setDelegate:_parentParserDelegate];
}

@end
