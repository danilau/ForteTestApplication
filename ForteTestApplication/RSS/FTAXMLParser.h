//
//  FTAXMLParser.h
//  ForteTestApplication
//
//  Created by majstrak on 22.03.14.
//  Copyright (c) 2014 Danilau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTAXMLParser : NSXMLParser

@property (strong, nonatomic) NSData* data;


- (id)initWithFile; // create the parser from file
- (id)initWithWeb; // create the parser from web

@end
