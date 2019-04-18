//
//  SATResultsViewController.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "SATResultsViewController.h"

@interface SATResultsViewController ()

@end

@implementation SATResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableFooterView:[UIView new]];
    [self fillInfo];
}

-(void)fillInfo{
    self.lblSchoolName.text = self.satScores.school_name;
    self.lblMathResults.text = self.satScores.sat_math_avg_score;
    self.lblReadingResults.text = self.satScores.sat_critical_reading_avg_score;
    self.lblWritingResults.text = self.satScores.sat_writing_avg_score;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
