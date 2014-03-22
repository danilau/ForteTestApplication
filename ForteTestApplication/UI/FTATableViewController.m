//
//  FTATableViewController.m
//  ForteTestApplication
//
//  Created by majstrak on 22.03.14.
//  Copyright (c) 2014 Danilau. All rights reserved.
//

#import "FTATableViewController.h"
#import "FTATableViewCell.h"
#import "FTAXMLParser.h"

@interface FTATableViewController ()

    @property BOOL isInItem;
    @property BOOL isTitle;
    @property BOOL isDescription;

@end

@implementation FTATableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self.isInItem = NO;
    self.isTitle = NO;
    self.isDescription = NO;
    
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", self.rssItems);
    
    FTAXMLParser *xmlParser = [[FTAXMLParser alloc] initWithWeb];
    
    xmlParser.delegate = self;
    
    //NSString *str = [[NSString alloc] initWithData:xmlParser.data encoding:NSUTF8StringEncoding];
    
    [xmlParser parse];
    
    //NSLog(@"%@", str);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FTATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FTACell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (NSMutableDictionary *) rssItems{
    if(_rssItems != nil) return _rssItems;
    else return [[NSMutableDictionary alloc] init];
}

#pragma mark - XML Parser delegation

//called when the document is parsed
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}

//this is called for each xml element
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"item"]) self.isInItem = YES;
    if([elementName isEqualToString:@"title"]) self.isTitle = YES;
    if([elementName isEqualToString:@"description"]) self.isDescription = YES;
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(self.isInItem && self.isTitle){
        
    }
}

//after each element it goes back to the parent after calling this method
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"item"]) self.isInItem = NO;
    if([elementName isEqualToString:@"title"]) self.isTitle = NO;
    if([elementName isEqualToString:@"description"]) self.isDescription = NO;
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
