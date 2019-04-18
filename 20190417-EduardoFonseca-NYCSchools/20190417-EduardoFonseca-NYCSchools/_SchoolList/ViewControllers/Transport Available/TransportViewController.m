//
//  TransportViewController.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "TransportViewController.h"

@interface TransportViewController ()

@end

@implementation TransportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableFooterView:[UIView new]];
    [self fillInfo];
}

-(void)fillInfo{

    self.lblSchoolName.text = self.schoolName;
    self.lblBusAvailable.text = self.bus;
    self.lblSubwayAvailable.text = self.subway;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return ![self.bus isEqualToString:@""]?UITableViewAutomaticDimension:0;
            break;
            
        case 1:
            return ![self.subway isEqualToString:@""]?UITableViewAutomaticDimension:0;
            break;
            
        default:
            return 60;
            break;
    }
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
