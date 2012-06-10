//
//  TFKViewController.m
//  TestForKIF
//
//  Created by Seth Sweep on 6/10/12.
//  Copyright (c) 2012 SethLab. All rights reserved.
//

#import "TFKViewController.h"

@interface TFKViewController ()

@end

@implementation TFKViewController

@synthesize tableView=_tableView;
@synthesize lastSelectedRow=_lastSelectedRow;

#pragma mark - table view delegate / data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];

    
    return cell;    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.lastSelectedRow = indexPath;
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (!self.lastSelectedRow)
    {
        return @"Hello world";
    }
    else 
    {
        return [NSString stringWithFormat:@"Row %d last selected", self.lastSelectedRow.row];
    }
    
}

#pragma mark - view boilerplate

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - object lifecycle

-(void)dealloc
{
    [self.lastSelectedRow release];
    [self.tableView release];
    [super dealloc];
}

@end
