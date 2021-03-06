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
    
    self.data = [NSData dataWithContentsOfURL:url];
    
    return [self initWithData:self.data];
}


@end
