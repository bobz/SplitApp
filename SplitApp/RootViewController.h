//
//  RootViewController.h
//  SplitApp
//
//  Created by bobz on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController {
    NSArray *siteNames;
    NSArray *siteAddresses;
}

@property (nonatomic, retain) NSArray *siteNames; 
@property (nonatomic, retain) NSArray *siteAddresses; 
		
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@end
