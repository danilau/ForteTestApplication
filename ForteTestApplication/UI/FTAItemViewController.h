//
//  FTAItemViewController.h
//  ForteTestApplication
//
//  Created by majstrak on 22.03.14.
//  Copyright (c) 2014 Danilau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTAItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *date;

@property (copy, nonatomic) NSString *description;

@end
