//
//  FTATableViewController.h
//  ForteTestApplication
//
//  Created by majstrak on 22.03.14.
//  Copyright (c) 2014 Danilau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTATableViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray *rssItems;

@end
