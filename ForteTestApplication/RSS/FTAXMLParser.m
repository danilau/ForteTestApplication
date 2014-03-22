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
    
    NSURL *url = [NSURL URLWithString:@"http://events.dev.by/rss"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
   #pragma unused(connection)
    
    return [self initWithData:self.data];
}

#pragma mark - URL connection methods implementation

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"SDF");
    
    self.data = [NSData dataWithData:data];
    
    NSString *str = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",str);
}

@end
