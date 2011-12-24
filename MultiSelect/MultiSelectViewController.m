//
//  MultiSelectViewController.m
//  MultiSelect
//
//  Created by Alex Coplan on 11/12/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MultiSelectViewController.h"

@implementation MultiSelectViewController
@synthesize table, items;

- (void)dealloc
{
    [table release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    items = [[NSArray alloc] initWithObjects:@"Item 1", @"Item 2", @"Item 3", @"Item 4", nil];
    
    for (int i = 0; i<[items count]; i++) {
        selected[i] = NO;
    }
    
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [items objectAtIndex:row];
    cell.accessoryType = selected[row] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    selected[row] = !selected[row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = selected[row] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)viewDidUnload
{
    [self setTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"Selected: "];
    for (int i = 0; i<[items count]; i++) {
        // UPLOAD STRINGS HERE
        if (selected[i]) [str appendFormat:@"%@ ",[items objectAtIndex:i]];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected Values" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
