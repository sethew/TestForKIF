//
//  TFKViewController.m
//  TestForKIF
//
//  Created by Seth Sweep on 6/10/12.
//  Copyright (c) 2012 SethLab. All rights reserved.
//

#import "TFKViewController.h"

#define ROW_HEIGHT 44.0f

@interface TFKViewController ()

@end

@implementation TFKViewController

@synthesize tableView=_tableView;
@synthesize lastSelectedRow=_lastSelectedRow;

#pragma mark - UIAlertViewDelegate protocol methods

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

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
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"UIAlertView" 
                                                        message:@"A Wild Modal Dialog Appeared"
                                                       delegate:self 
                                              cancelButtonTitle:nil 
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
    [alertView release];

    self.lastSelectedRow = indexPath;
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

- (void)loadView
{
    CGRect applicationFrame = [UIScreen mainScreen].applicationFrame;
    self.view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, applicationFrame.size.width, applicationFrame.size.height)]autorelease]; //49.0f is the height of the tabbar
    self.view.backgroundColor = [UIColor clearColor];

    self.tableView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped] autorelease];
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = ROW_HEIGHT;
    
    self.tableView.scrollEnabled = NO; //Change this to 'YES' to work-around the bug
    
    [self.view addSubview:self.tableView];
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
