//
//  TFKViewController.h
//  TestForKIF
//
//  Created by Seth Sweep on 6/10/12.
//  Copyright (c) 2012 SethLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFKViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,retain) IBOutlet UITableView* tableView;
@property(nonatomic,retain) NSIndexPath* lastSelectedRow;

@end
