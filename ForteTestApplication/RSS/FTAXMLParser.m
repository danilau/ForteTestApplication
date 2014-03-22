//
//  FTAXMLParser.m
//  ForteTestApplication
//
//  Created by majstrak on 22.03.14.
//  Copyright (c) 2014 Danilau. All rights reserved.
//

#import "FTAXMLParser.h"

@implementation FTAXMLParser

- (id)initWithFile{
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"rss" ofType:@"xml"];
    
    self.data = [NSData dataWithContentsOfFile:filePath];
    
    return [self initWithData:self.data];
}
- (id)initWithWeb{
    
    NSURL *url = [NSURL URLWithString:@"http://twitter.com/statuses/public_timeline.xml"];//url string to download
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url]; //set a request with the url
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self]; //start the connection and call connection methods from below
    
    return nil;
}

#pragma mark - URL connection methods implementation

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    self.data = [NSData dataWithData:data]; //append data from method call line to tweetsData tweetsData now holds xml file
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //[[self delegate] parserDidFinishLoading];
}

@end
