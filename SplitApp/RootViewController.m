//
//  RootViewController.m
//  SplitApp
//
//  Created by bobz on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "DetailViewController.h"

@implementation RootViewController
		
@synthesize detailViewController;
@synthesize siteNames, siteAddresses; 

- (void)viewDidLoad 
{     [super viewDidLoad];     
    self.clearsSelectionOnViewWillAppear = NO;     
    self.contentSizeForViewInPopover =  CGSizeMake(320.0, 600.0);      
    siteNames = [[NSArray alloc] 
                 initWithObjects:
                 @"Yahoo", 
                 @"Google",                  
                 @"Apple", 
                 @"eBookFrenzy", 
                 @"ElGee",
                 nil];      
    
    siteAddresses = [[NSArray alloc]
                     initWithObjects:
                     @"http://www.yahoo.com",
                     @"http:/www.google.com",
                     @"http://www.apple.com",
                     @"http://www.ebookfrenzy.com",
                     @"http://www.backpicks.com",
                     nil];  
}

		
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    		
}

		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [siteNames count];
    		
}


- (UITableViewCell *)tableView: (UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{     
    static NSString *CellIdentifier = @"Cell";      
    UITableViewCell *cell = [tableView         
                             dequeueReusableCellWithIdentifier:CellIdentifier];     
    if (cell == nil) 
    {         
        cell = [[[UITableViewCell alloc]            
                 initWithStyle:UITableViewCellStyleDefault            
                 reuseIdentifier:CellIdentifier] autorelease];     
    }      
    // Configure the cell.     
    cell.textLabel.text = [siteNames objectAtIndex:indexPath.row];     
    return cell; 
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
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *urlString = [siteAddresses objectAtIndex:indexPath.row];
    detailViewController.webView.scalesPageToFit = YES;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [detailViewController.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {     
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.     
    // For example: self.myOutlet = nil;     
    self.siteNames = nil;     
    self.siteAddresses = nil; 
}

- (void)dealloc 
{     
    [siteAddresses release];     
    [siteNames release];     
    [detailViewController release];     
    [super dealloc]; 
} 


@end
