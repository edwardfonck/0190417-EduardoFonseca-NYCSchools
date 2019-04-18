//
//  DetailTableViewController.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailTableViewController : UITableViewController

@property (nonatomic,strong) SchoolObject * schoolObjectDetail;
@property (nonatomic,weak) IBOutlet UILabel * lblSchoolName;

@property (nonatomic,weak) IBOutlet UILabel * lblCity;
@property (nonatomic,weak) IBOutlet UILabel * lblAddress;
@property (nonatomic,weak) IBOutlet UILabel * lblEmail;
@property (nonatomic,weak) IBOutlet UILabel * lblPhone;
@property (nonatomic,weak) IBOutlet UILabel * lblWebsite;
@property (nonatomic,weak) IBOutlet UILabel * lblAdmission;
@property (nonatomic,weak) IBOutlet UILabel * lblSport;
@property (nonatomic,weak) IBOutlet UILabel * lblPrograms;
@property (nonatomic,weak) IBOutlet UILabel * lblOverview;

@property (nonatomic,weak) IBOutlet UIButton * btnMap;
@property (nonatomic,weak) IBOutlet UIButton * btnSAT;
@end


NS_ASSUME_NONNULL_END
