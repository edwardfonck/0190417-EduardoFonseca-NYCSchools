//
//  DetailTableViewController.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "DetailTableViewController.h"
#import "MapViewController.h"
#import "SATResultsViewController.h"

@interface DetailTableViewController ()

@end
static NSString *const kSegueMap = @"goToMap";
static NSString *const kSATMap = @"goToSAT";
static NSString *const kLoadMessage = @"loading SAT Results...";
static NSString *const kLoadMapMessage = @"loading Map...";

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultInfo];
}


-(void)defaultInfo{
    if(!self.schoolObjectDetail){
        self.lblSchoolName.text = @"Select any school...";
        [self.btnMap setHidden:YES];
        [self.btnSAT setHidden:YES];
    }else
    {
        [self.btnMap setHidden:NO];
        [self.btnSAT setHidden:NO];
        [self fillInfo];
    }
}

-(void)fillInfo{
    [self.tableView setTableFooterView:[UIView new]];
    self.lblSchoolName.text = self.schoolObjectDetail.school_name;
    self.lblCity.text = self.schoolObjectDetail.city;
    self.lblAddress.text = self.schoolObjectDetail.primary_address_line_1;
    self.lblEmail.text = self.schoolObjectDetail.school_email;
    self.lblPhone.text = self.schoolObjectDetail.phone_number;
    self.lblWebsite.text = self.schoolObjectDetail.website;
    self.lblSport.text = self.schoolObjectDetail.school_sports;
    self.lblPrograms.text = self.schoolObjectDetail.ell_programs;
    self.lblAdmission.text = self.schoolObjectDetail.academicopportunities1;
    self.lblOverview.text = self.schoolObjectDetail.overview_paragraph;
}

-(IBAction)showInMap:(id)sender{
    [Loading showWithText:kLoadMapMessage];
    [self performSegueWithIdentifier:kSegueMap sender:self.schoolObjectDetail];
}

-(IBAction)showSATResults:(id)sender{
    
    [Loading showWithText:kLoadMessage];
    [SchoolWebServices service_getSchoolDetail:self.schoolObjectDetail.dbn onSucess:^(SatScoresObject * _Nonnull jsonObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loading remove];
            if(jsonObject){
             [self performSegueWithIdentifier:kSATMap sender:jsonObject];
            }else{
                [Utilities ShowAlertWithTitle:@"Advice" andMesssage:@"SAT Results not found" inViewController:self];
            }
        });
    } error:^(NSError * _Nonnull err) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loading remove];
           [Utilities ShowAlertWithTitle:@"Advice" andMesssage:@"SAT Results not found" inViewController:self];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.schoolObjectDetail?9:0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.schoolObjectDetail?1:0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.schoolObjectDetail?UITableViewAutomaticDimension:0;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:kSegueMap]){
        [Loading remove];
        MapViewController * vc = (MapViewController*)segue.destinationViewController;
        vc.schoolObject = (SchoolObject*)sender;
    }else if([segue.identifier isEqualToString:kSATMap])
    {
        SATResultsViewController * vc = (SATResultsViewController*)segue.destinationViewController;
        vc.satScores = (SatScoresObject*)sender;
    }
}


@end
