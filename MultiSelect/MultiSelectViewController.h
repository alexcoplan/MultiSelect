//
//  MultiSelectViewController.h
//  MultiSelect
//
//  Created by Alex Coplan on 11/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiSelectViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView *table;
    NSArray *items;
    BOOL selected[4];
}

@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) NSArray *items;

- (IBAction)buttonPressed:(id)sender;

@end
