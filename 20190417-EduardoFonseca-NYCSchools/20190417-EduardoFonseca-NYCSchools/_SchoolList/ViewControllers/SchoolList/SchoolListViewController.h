//
//  MasterViewController.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolCell.h"

@class DetailViewController;

@interface SchoolListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISplitViewControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (weak, nonatomic) IBOutlet UITableView * tbSchoolList;
@property (nonatomic,weak) IBOutlet UISearchBar * searchBar;



@end

