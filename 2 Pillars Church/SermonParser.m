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
    if ([elementName isEqualToString:@"pagetitle"]){
        if (!sermonTitle)
            sermonTitle = [[NSString alloc] init];
        return;
    }
    
    if ([elementName isEqualToString:@"series"]){
        if (!seriesTitle)
            seriesTitle = [[NSString alloc] init];
        return;
    }
    
    if ([elementName isEqualToString:@"byline"]){
        if (!byWho)
            byWho = [[NSString alloc] init];
        return;
    }
    
}

- (void)parseXMLFile:(NSString *)pathToFile {
    BOOL success;
    NSURL *xmlURL = [NSURL fileURLWithPath:pathToFile];
    NSXMLParser *addressParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    [addressParser setDelegate:self];
    [addressParser setShouldResolveExternalEntities:YES];
    success = [addressParser parse]; // return value not used
    // if not successful, delegate is informed of error
}

@end
