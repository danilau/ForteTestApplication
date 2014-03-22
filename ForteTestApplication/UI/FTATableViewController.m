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
@property BOOL isDate;
@property BOOL isDescription;
@property (nonatomic,strong) NSMutableString *titleBuf;
@property (nonatomic,strong) NSMutableString *dateBuf;
@property (nonatomic,strong) NSMutableString *descriptionBuf;

@end

@implementation FTATableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FTAXMLParser *xmlParser = [[FTAXMLParser alloc] initWithFile];
    
    self.isInItem = NO;
    self.isTitle = NO;
    self.isDate = NO;
    self.isDescription = NO;
    
    self.titleBuf = [NSMutableString stringWithFormat:@""];
    self.dateBuf = [NSMutableString stringWithFormat:@""];
    self.descriptionBuf = [NSMutableString stringWithFormat:@""];
    
    self.rssItems = [[NSMutableArray alloc] init];
    
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

    // Return the number of rows in the section.
    return [self.rssItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FTATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FTACell" forIndexPath:indexPath];
    
    cell.title.text = self.rssItems[[self.rssItems count]-indexPath.row - 1][@"title"];
    cell.date.text = self.rssItems[[self.rssItems count]-indexPath.row - 1][@"date"];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - XML Parser delegation

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"item"]) self.isInItem = YES;
    if([elementName isEqualToString:@"title"]) self.isTitle = YES;
    if([elementName isEqualToString:@"pubDate"]) self.isDate = YES;
    if([elementName isEqualToString:@"description"]) self.isDescription = YES;
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(self.isInItem && self.isTitle){
        [self.titleBuf appendString:string];
    }
    if(self.isInItem && self.isDate){
        [self.dateBuf appendString:string];
    }
    if(self.isInItem && self.isDescription){
        [self.descriptionBuf appendString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"item"]){
         self.isInItem = NO;

        NSMutableDictionary *bufDict = [[NSMutableDictionary alloc] init];
        [bufDict setObject:[self.titleBuf copy] forKey:@"title"];
        [bufDict setObject:[self.dateBuf copy] forKey:@"date"];
        [bufDict setObject:[self.descriptionBuf copy] forKey:@"description"];
        
        [self.rssItems addObject:bufDict];
        
        [self.titleBuf setString:@""];
        [self.dateBuf setString:@""];
        [self.descriptionBuf setString:@""];

        
    }
    if([elementName isEqualToString:@"title"]) self.isTitle = NO;
    if([elementName isEqualToString:@"pubDate"]) self.isDate = NO;
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
